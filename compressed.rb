eval((s='[["discorb","dotenv/load","sequel"].each{|g|require(g)},client=Discorb::Client.new(intents:Discorb::Intents.new(message_content:true),logger:Logger.new($stdout,level: Logger::INFO)),db=Sequel.connect("sqlite://db.sqlite3"),channels=db[:channels].all.map{|c|c[:id].to_s},client.on(:setup){db.create_table?(:channels){[primary_key(:id),integer(:added_by)]}},client.on(:message){|message|[message.author.bot?&&next,channels.include?(message.channel.id.to_s)||next,message.channel.is_a?(Discorb::TextChannel)||next,channel=message.channel,(channel.fetch_webhooks.wait.find{|w|w.name=="Pooper"}||channel.create_webhook("Pooper").wait).post(message.content.gsub(/[\p{Emoji}\p{Emoji_Component}&&[:^ascii:]]|<a?:[a-z0-9_]+:[0-9]+>/i,"\u{1f4a9}"),username:message.author.name,avatar_url:message.author.avatar.url,allowed_mentions:Discorb::AllowedMentions.new(everyone: false, roles: false, users: false)),message.delete]},client.once(:standby){puts("Logged"+32.chr+"in"+32.chr+"as"+32.chr+"#{client.user}")},client.slash("register","\u3053\u306e\u30c1\u30e3\u30f3\u30cd\u30eb\u3092\x50\x6f\x6f\x70\u3068\u3057\u3066\u767b\u9332\u3057\u307e\u3059\u3002",default_permission:Discorb::Permission.from_keys(:manage_channels)){|interaction|[interaction.channel.is_a?(Discorb::TextChannel)||(interaction.post("\u30c6\u30ad\u30b9\u30c8\u30c1\u30e3\u30f3\u30cd\u30eb\u3067\u5b9f\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002")&&next),channels.include?(interaction.channel.id.to_s)&&(interaction.post("\u65e2\u306b\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u3059\u3002")&&next),db[:channels].insert(id:interaction.channel.id,added_by:interaction.user.id),channels.push(interaction.channel.id.to_s),interaction.post("\u767b\u9332\u3057\u307e\u3057\u305f\u3002")]},client.slash("unregister","\u3053\u306e\u30c1\u30e3\u30f3\u30cd\u30eb\u3092\x50\x6f\x6f\x70\u304b\u3089\u524a\u9664\u3057\u307e\u3059\u3002",default_permission:Discorb::Permission.from_keys(:manage_channels)){|interaction|[channels.include?(interaction.channel.id.to_s)||(interaction.post("\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093\u3002")&&next),db[:channels].where(id:interaction.channel.id.to_s).delete,channels.delete(interaction.channel.id.to_s),interaction.post("\u524a\u9664\u3057\u307e\u3057\u305f\u3002")]},client.slash("qusine","\u3053\u306e\x42\x6f\x74\u306e\u30bd\u30fc\u30b9\u30b3\u30fc\u30c9\u3092\u8868\u793a\u3057\u307e\u3059\u3002"){|interaction|interaction.post(attachment:Discorb::Attachment.from_string(32.chr*51+"eval("+10.chr+32.chr*49+"(s="+39.chr+s+39.chr+").gsub(/"+92.chr+"s/,"+39.chr*2+"))","pooper.rb"))},client.run(ENV.fetch("TOKEN"))]').gsub(/\s/,''))

