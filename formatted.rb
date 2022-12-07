                                                   eval(                                                           
                                                 (s='[["dis                                                        
                                                corb","dotenv/l                                                    
                                               oad","sequel"].each{|g|re                                           
                                              quire(g)},client=Discorb::Clie                                       
                                              nt.new(intents:Discorb::Intents.                                     
                                           new(message_content:true),logger:Lo                                     
                                  gger.new($stdout,level:Logger::INFO)),db=Seq                                     
                              uel.connect("sqlite://db.sqlite3"),channels=db[:ch                                   
                            annels].all.map{|c|c[:id].to_s},client.on(:setup){db.crea                              
                           te_table?(:channels){[primary_key(:id),integer(:added_by)]}},c                          
                           lient.on(:message){|message|[message.author.bot?&&next,channels.                        
                           include?(message.channel.id.to_s)||next,message.channel.is_a?(Dis                       
                            corb::TextC           hannel)||next,chann          el=message.cha                      
                             nnel,(c                hannel.fetch_w                 ebhooks.wai                     
                       t.find{|w|w.        name=      ="Pooper"}|      |cha         nnel.creat                     
                    e_webhook("Poo       per").wai     t).post(m    essage.con       tent.gsub                     
                  (/[\p{Emoji}\p{       Emoji_Compo    nent}&&[:   ^ascii:]]|<a      ?:[a-z0-9_                    
                 ]+:[0-9]+>/i,"\u       {1f4a9}"),us   ername:me   ssage.author      .name,avatar_                 
                url:message.autho       r.avatar.ur    l,allowed   _mentions:Di      scorb::AllowedM               
                entions.new(everyo       ne:false,    roles:fals     e,users:        false)),message.d             
                elete]},client.once                  (:standby){p                  uts("Logged"+32.chr+            
                "in"+32.chr+"as"+32.c              hr+"#{client.use               r}")},client.slash("re           
                 gister","\u3053\u306e\u        30c1\u30e3\u30f3\u30cd        \u30eb\u3092\x50\x6f\x6f\x7          
                  0\u3068\u3057\u3066\u767b\u9332\u3057\u307e\u3059\u3002",default_permission:Discorb::Pe          
              rmission.from_keys(:manage_channels)){|interaction|[interaction.channel.is_a?(Discorb::Text          
           Channel)||(interaction.post("\u30c6\u30ad\u30b9\u30c8\u30c1\u30e3\u30f3\u30cd\u30eb\u3067\u5b9          
         f\u884c\u3057\u3066\u304f\u3060\u3055\u3044\u3002")&&next),channels.include?(interaction.channel          
       .id.to_s)&&(interaction.po                                                    st("\u65e2\u306b\u767         
      b\u9332\u3055\u308c\u3066\u                                                    3044\u307e\u3059\u3002"       
     )&&next),db[:channels].insert                                                  (id:interaction.channel.id     
    ,added_by:interaction.user.id),                                                channels.push(interaction.ch    
    annel.id.to_s),interaction.post("\u                                        767b\u9332\u3057\u307e\u3057\u30    
   5f\u3002")]},client.slash("unregister","\                              u3053\u306e\u30c1\u30e3\u30f3\u30cd\u3   
    0eb\u3092\x50\x6f\x6f\x70\u304b\u3089\u524a\                      u9664\u3057\u307e\u3059\u3002",default_per   
    mission:Discorb::Permission.from_keys(:manage_channels)){|interaction|[channels.include?(interaction.channel   
     .id.to_s)||(interaction.post("\u767b\u9332\u3055\u308c\u3066\u3044\u307e\u305b\u3093\u3002")&&next),db[:ch    
      annels].where(id:interaction.channel.id.to_s).delete,channels.delete(interaction.channel.id.to_s),intera     
       ction.post("\u524a\u9664\u3057\u307e\u3057\u305f\u3002")]},client.slash("qusine","\u3053\u306e\x42\x6f      
         \x74\u306e\u30bd\u30fc\u30b9\u30b3\u30fc\u30c9\u3092\u8868\u793a\u3057\u307e\u3059\u3002"){|interac       
            tion|interaction.post(attachment:Discorb::Attachment.from_string(32.chr*51+"eval("+10.chr+32.          
               chr*49+"(s="+39.chr+s+39.chr+").gsub(/       "+92.chr+"s/,"+39.chr*2+"))","pooper.rb"))             
                     },client.run(ENV.fetch(                          "TOKEN"))]').gsub(/\s/,''))                  
