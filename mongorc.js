// figure out how to do this for older mongo versions that don't use mozjs (db.serverBuildInfo())

// always pretty print results
DBQuery.prototype._prettyShell = true;

//----------------------------------------------------------------------------
// Color Functions
//----------------------------------------------------------------------------
__ansi = {
	csi: String.fromCharCode(0x1B) + '[',
	reset:      '0',
	text_prop:  'm',
	foreground: '3',
	bright:     '1',
	underline:  '4',

	colors: {
		black:   '0',
		red:     '1',
		green:   '2',
		yellow:  '3',
		blue:    '4',
		magenta: '5',
		cyan:    '6',
		gray:    '7',
	}
};

__colorize = true;

controlCode = ( parameters ) => {
	if ( parameters === undefined ) {
		parameters = "";
	}
	else if (typeof(parameters) == 'object' && (parameters instanceof Array)) {
		parameters = parameters.join(';');
	}

	return __ansi.csi + String(parameters) + String(__ansi.text_prop);
};

applyColorCode = ( string, properties, nocolor ) => {
	// Allow global __colorize default to be overriden
	let applyColor = (null == nocolor) ? __colorize : !nocolor;

	return applyColor ? controlCode(properties) + String(string) + controlCode() : String(string);
};

colorize = ( string, color, nocolor ) => {

	let params = [];
	let code = __ansi.foreground + __ansi.colors[color.color];

	params.push(code);

	if ( color.bright === true ) params.push(__ansi.bright);
	if ( color.underline === true ) params.push(__ansi.underline);

	return applyColorCode( string, params, nocolor );
};

colorizeAll = ( strings, color, nocolor ) => strings.map((string) => colorize( string, color, nocolor ));

// finish this at some point? skip admin and local dbs?
// createUsers = () => {
// 	// only do this locally.
// 	if (db.serverBuildInfo().buildEnvironment.target_os !== 'osx') { return }
// 	db.getMongo().getDBs().databases.forEach(({name}) => {
// 		db = db.getSiblingDB(name);
// 		db.dropAllUsers();
// 		db.createUser({ user: 'admin', pwd: 'password', roles: [ {role: "dbAdmin", db: name}, {role: "readWrite", db: name}]});
// 	})
// };

prompt = () => {
	let { host, process } = db.serverStatus();
	let version = db.serverBuildInfo().version;
	let repl_set = db._adminCommand({"replSetGetStatus": 1}).ok !== 0;
	let rs_state = '';
	if(repl_set) {
		let { members, set }= rs.status();
		rs_state = members.reduce((out, curr) => curr.self ? `${curr.stateStr}:${set}` : out, '');
	}
	let state = db.isMaster().msg == 'isdbgrid' ? 'mongos' : rs_state;
	let userInfo = db.runCommand({connectionStatus : 1}).authInfo.authenticatedUsers[0];
	return `[${ state }]-${ userInfo ? userInfo.user : '<anon>' }@${ host.split('.')[0] }/${ db } (${ process }-${ version }):${ new Date().toLocaleTimeString() } > `;
}
