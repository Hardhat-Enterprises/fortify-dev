import React from 'react';

function Footer() {
	return (
		<div className="main-footer">
			<div className="container" style={{position:"fixed",left:0,bottom:0,right:0}}>
				<div className="row">
					{/* Column 1 */}
					<div className="col-md-3 col-sm-6">
						<h4>Lorem ipsum</h4>
						<ul className="list-unstyled">
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
						</ul>
					</div>
					{/* Column 2 */}
					<div className="col-md-3 col-sm-6">
						<h4>Lorem ipsum</h4>
						<ul className="list-unstyled">
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
						</ul>
					</div>
					{/* Column 3 */}
					<div className="col-md-3 col-sm-6">
						<h4>Lorem ipsum</h4>
						<ul className="list-unstyled">
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
						</ul>
					</div>
					{/* Column 4 */}
					<div className="col-md-3 col-sm-6">
						<h4>Lorem ipsum</h4>
						<ul className="list-unstyled">
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
							<li>Lorem ipsum</li>
						</ul>
					</div>
				</div>
				{/* Footer Bottom */}
				<div className="footer-bottom">
					<p className="text-xs-center">
						&copy;{new Date().getFullYear()} Help Fortify - All Rights Reserved
					</p>
				</div>
			</div>
		</div>

	);
}

export default Footer;