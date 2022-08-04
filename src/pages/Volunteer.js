const Volunteer = () => {
    return <html>
      <link rel='stylesheet' href='./css/volunteer.css'></link>
      <head>
        <title>Fortify Profile page</title>

      </head>
      <body>
        <div>
          <img id='img01' class='aa00' src='profile.jpg' height='170px' width='170px' ></img>
          <img id='img01' class='aa00' src='./img/logo.png' height='50px' width='50px' >  </img>
        </div>
        <div>
          <h2>Fortify</h2><br><br><br><br></br></br></br></br>
          <h3>SENER YILMAZ</h3>
          <h5>Front-end developer</h5>
        </div>
        <div id='navbar' >
          <ul>
            <li><a>Home</a></li>
            <li><a>Organisation</a></li>
            <li><a>Volunteer</a></li>
            <li><a>Search</a></li>
          </ul>
          </div>
          <div class='aboutme' id='aboutme' >
            <p class='active01' > &#128515; </p>
            <p class='active02' > About me </p>
            <p id='plus' > &#10133; </p>
            </div>

            <div class='Qual' id='qual01' >
              <p id='active03' > &#127913; Qualifications </p>
              <p id='active04' > To be Completed! </p>
            </div>
            <div id='skill' >
              <p class='skill01' > &#129351; Primary Skills </p><br></br>
              <p class='design01' > Ethical Hacking </p><br></br>
              <p class='design01' > Intrusion Detection </p><br></br>
              <p class='design01' > SIEM Management </p><br></br>
              <p class='design01' > Incident Handeling </p><br></br>
              <p class='design01' > Problem Solving </p><br></br>
              <p className='design01' > Team Work </p>
            </div>
            <button class='r1' id='bttn01' > Submit </button>
      
         
       
      </body>
    </html>;
  };
  
  export default Volunteer;
  