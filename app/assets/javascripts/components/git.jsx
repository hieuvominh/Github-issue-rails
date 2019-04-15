
class Git extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
          id:0,
          gitissue: this.props.gitissue,
          value:'open'
        }
        this.openModal = this.openModal.bind(this);
        this.closeModal = this.closeModal.bind(this);
        this.filter = this.filter.bind(this);
        this.change = this.change.bind(this);
        this.forceUpdateHandler = this.forceUpdateHandler.bind(this);
    }

    forceUpdateHandler(){
      this.forceUpdate();
    }

    closeModal(){
      var modal = document.getElementById('myModal');
      modal.style.display = "none";
    }

    filter(str){
    
      let temp = [];
      if(str!= "All"){
        this.props.gitissue.forEach(function(item){
          if(item.state == str){
            temp.push(item);
          }
        });
      }else{
        temp = this.props.gitissue
      }

      this.setState({
        gitissue : temp
      });

      this.forceUpdateHandler();
    }

    componentDidMount(){
        this.filter('open');
    }
    
    change(){
      this.setState({value: event.target.value});
      this.filter(event.target.value);
    }

    openModal(i){
      this.setState({
        id: i
      });
      var modal = document.getElementById('myModal');
      modal.style.display = "block";
    }

    render() {
      window.onclick = function(event) {
        var modal = document.getElementById('myModal');
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
      
      let _git = this.state.gitissue;
      
      return (
        <div onClick={this.closeAll} className="for-component-tags">
         <select onChange={() => this.change()} value={this.state.value}>
            <option value="open">Open</option>
            <option value="closed">Closed</option>
            <option value="All">All</option>
            
          </select>
        {_git.map((git, i) => {
          
        return (
         
          <table  key={i}> 
              <tbody>
                  <tr>
                    <td>
                      <p><b>ISSUE: #{i+1}</b></p>
                      <p><b>State: {git.state}</b></p>
                      <h3 className="font-for-title">
                        <a onClick={() => this.openModal(i)} className="for-title">{git.title}</a>
                      </h3>
                    </td>
                  </tr>
                  <tr >
                    <td>
                      {git.body}
                    </td>
                  </tr>
                  <tr >
                    <td>
                      <span><p className="font-for-details">{git.created_at}</p></span>
                    </td>
                </tr> 
            </tbody>
            <tfoot >
              <div className="border"></div>
            </tfoot>
          </table>
        )
      })}
       
            <div id="myModal" className="modal">
              <div className="modal-content">
                <span onClick={this.closeModal} className="close">&times;</span>
                <p><b>ID</b>: {this.props.gitissue[this.state.id].id}</p>
                <p><b>Title</b>: {this.props.gitissue[this.state.id].title}</p>
                <p><b>State</b>: {this.props.gitissue[this.state.id].state}</p>
                <p><b>Locked</b>: {this.props.gitissue[this.state.id].locked}</p>
                <p><b>Assignee</b>: {this.props.gitissue[this.state.id].assignee}</p>
                <p><b>Body</b>: {this.props.gitissue[this.state.id].body}</p>
                <p><b>No comment</b>: {this.props.gitissue[this.state.id].comments}</p>
                <p><b>Created at</b>: {this.props.gitissue[this.state.id].created_at}</p>
                <p><b>Updated at</b>: {this.props.gitissue[this.state.id].updated_at}</p>
                <p><b>Closed at</b>: {this.props.gitissue[this.state.id].id}</p>
                <p><b>Author association</b>: {this.props.gitissue[this.state.id].author_association}</p>
              </div>
            </div>
    </div>
      );
    };
  }