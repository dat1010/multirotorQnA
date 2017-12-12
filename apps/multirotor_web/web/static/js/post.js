import socket from './socket'

(function() {
	let id = $('id').data('id');
	if(!id)
		return;

	let channel = socket.channel("post:" + id, {});

	channel.on("update_quantity", post => {
		console.log("Update", post);
		$('h4 span').text(post.quantity);
	});

	channel.join()
		.receive("ok", resp => { console.log("Joined successfully post:" + id, resp)
		})
		.receive("error", resp => {console.log("Unable to join", resp)});
})();
