<?php
// wbb imports
require_once(WBB_DIR.'lib/data/boxes/PortalBox.class.php');
require_once(WBB_DIR.'lib/data/boxes/StandardPortalBox.class.php');

/**
 * @author  Marco Daries
 * @Website www.mada-network.de
 * @package	de.madanetwork.irc.useronline.portalbox
 * @svn		$Id: IRCUserOnlineBox.class.php 1658 2011-01-08 15:31:14Z TobiasH87 $
 */

class IRCUserOnlineBox extends PortalBox implements StandardPortalBox {
	/**	 
	 * @see StandardPortalBox::readData()
	 */
	public function readData() {	
		$ircusersOnline = array();

		WCF::getCache()->addResource('ircUserOnline', WBB_DIR.'cache/cache.ircUserOnline.php', WBB_DIR.'lib/system/cache/CacheBuilderIRCUserOnline.class.php', 0, IRCUSERONLINE_CACHETIME);
		$ircUserOnline = WCF::getCache()->get('ircUserOnline');
		
		WCF::getTPL()->assign(array('ircUserOnline' => $ircUserOnline));
		
	}

	/**	 
	 * @see StandardPortalBox::getTemplateName()
	 */
	public function getTemplateName() {
		return 'ircUserOnlineBox';
	}
}
?>