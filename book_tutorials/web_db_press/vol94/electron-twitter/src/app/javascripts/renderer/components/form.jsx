const React = require('react');
const T = require('../services/twitter');
const {dialog} = require('electron').remote;

module.exports = class FormContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {text: ''};
  }

  render() {
    return (
      <div className='window'>
        <div id='window-content' className='window-content'>
          <div>
            <textarea style={{width: 300, height: 250}}
              onChange={this.handleTextChange.bind(this)}
              value={this.state.text}/>
          </div>
        </div>
        <footer clasName='toolbar toolbar-footer'>
          <div clasName='toolbar-actions'>
            <button clasName='btn btn-primary pull-right'
              onClick={this.handleSendButtonClick.bind(this)}>
              ツイート
            </button>
          </div>
        </footer>
      </div>
    );
  }

  handleTextChange(e) {
    this.setState({text: e.target.value});
  }

  handleSendButtonClick() {
    dialog.showMessageBox({
      type: 'question',
      title: '確認',
      message: 'ツイートしてもよろしいですか？',
      buttons: ['はい', 'いいえ'],
      defaultId: 0,
      cancelId: 1
    }, (index) => {
      if (index === 1) {
        return;
      }
      let params = {status: this.state.text.trim()};
      T.post('statuses/update', params)
        .catch(error => {
          console.log(error);
        })
        .then(result => {
          console.log(result);
          this.setState({text: ''});
        });
    });
  }
};