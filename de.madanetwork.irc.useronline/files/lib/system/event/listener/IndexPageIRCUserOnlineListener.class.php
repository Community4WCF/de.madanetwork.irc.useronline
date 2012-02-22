<?php
// wcf imports
require_once(WCF_DIR.'lib/system/event/EventListener.class.php');

/**
 * @author	Marco Daries
 * @website www.mada-network.de
 * @package	de.madanetwork.irc.useronline
 * @svn		$Id: IndexPageIRCUserOnlineListener.class.php 1658 2011-01-08 15:31:14Z TobiasH87 $
 */

class IndexPageIRCUserOnlineListener implements EventListener {
	/**
	* @see EventListener::execute()
	*/
	public function execute($eventObj, $className, $eventName) {
		$ircUserOnline = array();

		if(!MODULE_IRCUSERONLINE || !WCF::getUser()->getPermission('user.board.canViewIRCUserOnline')) return;
		
		WCF::getCache()->addResource('ircUserOnline', WBB_DIR.'cache/cache.ircUserOnline.php', WBB_DIR.'lib/system/cache/CacheBuilderIRCUserOnline.class.php', 0, IRCUSERONLINE_CACHETIME);
		$ircUserOnline = WCF::getCache()->get('ircUserOnline');
		
		if($ircUserOnline['userstotal']) {
			WCF::getTPL()->assign(array('ircUserOnline' => $ircUserOnline));
			WCF::getTPL()->append('additionalBoxes', WCF::getTPL()->fetch('ircUserOnline'));
		}
	}
}
?>