# -*- coding: utf-8 -*-
require 'optparse'

module Todo
  class Command
    module Options
      def self.parse!(argv)
        options = {}
        sub_command_parsers = create_sub_command_parsers(options)
        command_parser = create_command_parser

        begin
          command_parser.order!(argv)
          options[:command] = argv.shift
          sub_command_parsers[options[:command]].parse!(argv)

          # update と delete の場合は id を取得する
          if %w(update delete).include?(options[:command])
            raise ArgumentError, "#{options[:command]} id not found." if argv.empty?
            options[:id] = Integer(argv.first)
          end
        rescue OptionParser::MissingArgument, OptionParser::InvalidOption, ArgumentError => e
          abort e.message
        end
        options
      end

      def self.create_sub_command_parsers(options)
        sub_command_parsers = Hash.new do |_k, v|
          raise ArgumentError, "'#{v}' is not todo sub command."
        end

        sub_command_parsers['create'] = OptionParser.new do |opt|
          opt.banner = 'Usage: create <args>'
          opt.on('-n VAL', '--name=VAL',    'task name')    { |v| options[:name]    = v }
          opt.on('-c VAL', '--content=VAL', 'task content') { |v| options[:content] = v }
          opt.on_tail('-h', '--help', 'Show this message')  { |_v| help_sub_command(opt) }
        end

        sub_command_parsers['list'] = OptionParser.new do |opt|
          opt.banner = 'Usage: list <args>'
          opt.on('-s VAL', '--status=VAL', 'search status') { |v| options[:status] = v }
          opt.on_tail('-h', '--help', 'Show this message')  { |_v| help_sub_command(opt) }
        end

        sub_command_parsers['update'] = OptionParser.new do |opt|
          opt.banner = 'Usage: update id <args>'
          opt.on('-n VAL', '--name=VAL',    'search name')    { |v| options[:name] = v }
          opt.on('-n VAL', '--content=VAL', 'search content') { |v| options[:content] = v }
          opt.on('-n VAL', '--status=VAL',  'search status')  { |v| options[:status] = v }
          opt.on_tail('-h', '--help', 'Show this message')    { |_v| help_sub_command(opt) }
        end

        sub_command_parsers['delete'] = OptionParser.new do |opt|
          opt.banner = 'Usage: delete'
          opt.on_tail('-h', '--help', 'Show this message') { |_v| help_sub_command(opt) }
        end

        sub_command_parsers
      end

      def self.help_sub_command
        puts parse.help
        exit
      end

      def self.create_command_parser
        OptionParser.new do |opt|
          sub_command_help = [
            { name: 'create -n name -c content',              summary: 'Create Todo task' },
            { name: 'update id -n name -c content -s status', summary: 'Update Todo task' },
            { name: 'list -s status',                         summary: 'List   Todo task' },
            { name: 'delete id',                              summary: 'Delete Todo task' },
          ]
          opt.banner = "Usage: #{opt.program_name} [-h|--help] [-v|--version] <command> [<args>]"
          opt.separator ''
          opt.separator "#{opt.program_name} Available Commands:"
          sub_command_help.each do |command|
            opt.separator [opt.summary_indent, command[:name].ljust(40), command[:summary]].join(' ')
          end

          opt.on_head('-h', '--help', 'Show this message') do |_v|
            puts opt.help
            exit
          end

          opt.on_head('-v', '--version', 'Show program version') do |_v|
            opt.version = Todo::VERSION
            puts opt.ver
            exit
          end
        end
      end
      private_class_method :create_sub_command_parsers, :create_command_parser, :help_sub_command
    end
  end
end