var requirePeer = require('codependency').get('mage');

// HACK
// const zmq = requirePeer('zmq');
const zmq = requirePeer('zeromq');

/**
 * Creates and returns a dealer socket with a specific identity
 *
 * @param {string} [identity]
 * @returns {zmq.Socket}
 */

module.exports = function (identity) {
	var dealer = zmq.createSocket('dealer');

	if (identity) {
		dealer.identity = identity;
	}

	return dealer;
};
