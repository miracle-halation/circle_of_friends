import React from "react"
import PropTypes from "prop-types"
export default class Preview extends React.Component {
  constructor(props){
    super(props);
    this.state = {image_src: ""}
    this.handleChangeFile = this.handleChangeFile.bind(this);
  }

  handleChangeFile(e) {
    if (e.target.files === null){
      return
    };

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    this.setState({image_src: blob});
  }

  render () {
    return (
      <div>
        <input type="file" name="article[image]" id="article_image" ref="file" onChange={this.handleChangeFile} />
        <img src={this.state.image_src} />
      </div>
    );
  }
}



