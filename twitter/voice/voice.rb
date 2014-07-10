require 'twitter'
require 'voice_text_api'
require 'open3'
require 'yaml'

class VoiceSample
  SPEAKER = [:haruka, :hikari, :takeru]

  def initialize
    settings  = YAML.load_file('settings.yml')
    @client   = Twitter::REST::Client.new(settings['twitter'])
    @voice    = VoiceTextAPI.new(settings['voice_api_key'])
    @sox_path = settings['sox_path']
  end

  def speak
    @client.home_timeline({count: 200}).each do |tweet|
      speaker = SPEAKER[rand(3)]
      text = tweet.text
      emolevel =  text.match(/[!！]/) ? 2 : 1
      emotion = distinguish_emotion(text)

      if emotion
        wav = @voice.tts(text, speaker, emotion: emotion, emotion_level: emolevel)
      else
        wav = @voice.tts(text, speaker)
      end
      Open3.capture3("#{@sox_path + '/play -'}", stdin_data: wav)
    end
  rescue
    puts "RuntimeError: #{$!}"
  end

  private
    def distinguish_emotion(text)
      case text
      when /[喜嬉楽幸]/
        :happiness
      when /[悲辛苦]/
        :sadness
      when /[怒]/
        :anger
      else
        nil
      end
    end
end

if $0 == __FILE__
  VoiceSample.new.speak
end
