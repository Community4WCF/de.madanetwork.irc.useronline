<div class="{cycle values='container-1,container-2'}">
	<div class="containerIcon"><img src="{icon}ircM.png{/icon}" alt="" /></div>
	<div class="containerContent">
		{if IRCUSERONLINE_CHAT_ENABLE}
		<h3><a href="{IRCUSERONLINE_CHAT_LINK}">{lang}wbb.index.ircuseronline{/lang}</a></h3>
		{else}
		<h3>{lang}wbb.index.ircuseronline{/lang}</h3>
		{/if}
		{foreach from=$ircUserOnline.channels key=keys item=chan}
			<p class="smallFont"> {$chan.channel} ({$chan.users} {lang}wbb.index.ircuseronline.channeluser{/lang}):
				{foreach from=$ircUserOnline.users item=user}
					{if $user.channel == $chan.channel}
						{counter assign=counter name=$chan.channel print=false}						
						{if $counter > 1}, {/if}<span{if $user.op} style="color:{IRCUSERONLINE_COLOR_OP}"{elseif $user.voice} style="color:{IRCUSERONLINE_COLOR_VOICE}"{/if}>{$user.nickname}</span>
					{/if}
				{/foreach}
			</p>
		{/foreach}
		<p class="smallFont">{lang}wbb.index.ircuseronline.legende{/lang}: <span style="color:{IRCUSERONLINE_COLOR_OP}">{lang}wbb.index.ircuseronline.op{/lang}</span>, <span style="color:{IRCUSERONLINE_COLOR_VOICE}">{lang}wbb.index.ircuseronline.voice{/lang}</span></p>
	</div>
</div>