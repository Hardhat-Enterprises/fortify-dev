import React from 'react';
import { Nav, Navbar, Form, FormControl, Button, Container } from 'react-bootstrap'
import logo from '../img/logo.png'
import { withKeycloak } from '@react-keycloak/web';

// export default class NavbarComp extends Component {
const NavbarComp = ({ keycloak, keycloakInitialized }) => {
  // render() {
  // const { keycloak, initialized } = useKeycloak();
  return (
    <div>
      <>
        <Navbar collapseOnSelect expand="lg" bg="light" variant="light">
          <Container>

            <Navbar.Brand href="/">
              <img
                alt=""
                src={logo}
                width="35"
                height="33"
                className="d-inline-block align-top"
              />{' '}
              Help Fortify
            </Navbar.Brand>


            <Navbar.Toggle aria-controls="responsive-navbar-nav" />
            <Navbar.Collapse id="responsive-navbar-nav">

              <Nav
                className="d-flex"
                style={{ maxHeight: '100px', flex: 1 }}
              >
                {/* <Nav.Link href="/">Home</Nav.Link> */}
                <Nav.Link href="/organization">Organization</Nav.Link>
                <Nav.Link href="/volunteer">Volunteer</Nav.Link>
                <Nav.Link href="/about">About</Nav.Link>
                <Nav.Link href="/secured">Secured</Nav.Link>


                <Form className="d-flex ms-auto"
                >
                  <FormControl
                    type="search"
                    placeholder="Search"
                    className="me-2"
                    aria-label="Search"
                  />
                  <Button variant="outline-success" className="btn-margin-right"> Search </Button>
                </Form>
                <Button variant="primary" className="btn-margin-left"> Sign Up </Button>
                {!keycloak.authenticated &&
                  <Button type="button" variant="primary" className="btn-margin-left" onClick={() => keycloak.login()}> Login </Button>}
                {!!keycloak.authenticated &&
                  <Button type="button" variant="secondary" className="btn-margin-left" onClick={() => keycloak.logout()}> Logout ({keycloak.tokenParsed.preferred_username}) </Button>}
                  
              </Nav>

            </Navbar.Collapse>

          </Container>
        </Navbar>
      </>
    </div>
  )
}

export default withKeycloak(NavbarComp)