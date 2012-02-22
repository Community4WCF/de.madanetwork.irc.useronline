<?PHP
// wcf imports
require_once(WCF_DIR.'lib/system/cache/CacheBuilder.class.php');

/**
 * @author	Marco Daries
 * @website www.mada-network.de
 * @package	de.madanetwork.irc.useronline
 * @svn		$Id: CacheBuilderIRCUserOnline.class.php 1658 2011-01-08 15:31:14Z TobiasH87 $
 */

class CacheBuilderIRCUserOnline implements CacheBuilder {
	/**
	 * @see CacheBuilder::getData()
	 */
	public function getData($cacheResource) {
		$data = array(
			'users' => array(),
			'userstotal' => 0,
			'channels' => array()
		);
				
		$sql = "SELECT * 
				FROM wbb".WBB_N."_irc_useronline
				ORDER BY nickname ASC";
		$result = WCF::getDB()->sendQuery($sql);
		while ($row = WCF::getDB()->fetchArray($result)) {
			$data['users'][] = $row;
			$data['userstotal']++;
		}

		$sql = "SELECT COUNT(channel) AS users, channel 
				FROM wbb".WBB_N."_irc_useronline 
				GROUP by channel ASC";
		$result = WCF::getDB()->sendQuery($sql);
		while ($row = WCF::getDB()->fetchArray($result)) {
			$data['channels'][] = $row;
		}
	
	return $data;
	}	
}
?>