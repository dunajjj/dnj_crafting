dnj = {}
--- @param reqjob job|true:false
dnj.craftings = {
    {
        model = `gr_prop_gr_bench_04b`,
        coords = vec3(1322.1681, 4308.3999, 38.0592), 
        reqjob = false, 
        targetlabel = "Crafting - Pistolky",
        heading = 341.4297,
        targeticon = "fas fa-gun",
        recipes = {
            {
                resultitem = "weapon_pistol50",
                resultlabel = "Deagle",  
                iconname = "weapon_pistol50",  
                crafttime = 5000,          
                reqitems = {
                    { item = "dnj_pistolmagazine", count = 1, label = "Zásobník do zbraně" },
                    { item = "dnj_pistolbody", count = 1, label = "Tělo pistolky" },
                    { item = "dnj_spring", count = 1, label = "Pružina" },
                    { item = "dnj_steel", count = 25, label = "Ocel" },

                }
            },

            {
                resultitem = "weapon_pistol_mk2",
                resultlabel = "Baretta M9A3",  
                iconname = "weapon_pistol_mk2",  
                crafttime = 5000,          
                reqitems = {
                    { item = "dnj_pistolmagazine", count = 1, label = "Zásobník do zbraně" },
                    { item = "dnj_pistolbody", count = 1, label = "Tělo pistolky" },
                    { item = "dnj_spring", count = 1, label = "Pružina" },
                    { item = "dnj_steel", count = 20, label = "Ocel" },

                }
            },

            {
                resultitem = "weapon_machinepistol",
                resultlabel = "TEC-9",
                iconname = "weapon_machinepistol",
                crafttime = 5000,
                reqitems = {
                    { item = "dnj_pistolmagazine", count = 1, label = "Zásobník do zbraně" },
                    { item = "dnj_pistolbody", count = 1, label = "Tělo pistolky" },
                    { item = "dnj_spring", count = 7, label = "Pružina" },
                    { item = "dnj_steel", count = 25, label = "Ocel" },
                    { item = "dnj_pistolbarrel2", count = 1, label = "Barrel pro pistolku" },
                    { item = "dnj_pistolpercurssor", count = 3, label = "Pistolový perkusor" },
                }
            },
        }
    },

    {
        model = `gr_prop_gr_bench_04b`,
        coords = vec3(-88.6096, 6518.1396, 31.4907), -- -87.1357, 6520.5015, 31.4907, 226.2729 
        reqjob = false, 
        targetlabel = "Crafting - Krátke zbraně",
        heading = 226.2729,
        targeticon = "fas fa-gun",
        recipes = {
            {
                resultitem = "weapon_sawnoffshotgun",
                resultlabel = "BSM123",  
                iconname = "weapon_sawnoffshotgun",  
                crafttime = 15000,          
                reqitems = {
                    { item = "dnj_pistolmagazine", count = 1, label = "Zásobník do zbraně" },
                    { item = "dnj_pistolbody", count = 1, label = "Tělo pistolky" },
                    { item = "dnj_spring", count = 10, label = "Pružina" },
                    { item = "dnj_steel", count = 35, label = "Ocel" }, -- dnj_rope
                    { item = "dnj_rope", count = 5, label = "Lano" },    
                    { item = "dnj_ductape", count = 2, label = "Lepíci páska" },

                }
            },
            {
                resultitem = "weapon_microsmg",
                resultlabel = "Uzi",
                iconname = "weapon_microsmg",
                crafttime = 15000,
                reqitems = {
                    { item = "dnj_smgbody", count = 1, label = "Tělo SMG" },
                    { item = "dnj_smgbarrel", count = 1, label = "Barrel pro SMG" },
                    { item = "dnj_spring", count = 15, label = "Pružina" },
                    { item = "dnj_steel", count = 35, label = "Ocel" },
                    { item = "dnj_velcro", count = 1, label = "Suchý zips" },
                    { item = "dnj_pistolpercurssor", count = 3, label = "Pistolový perkusor" },
                    { item = "dnj_gunpowder", count = 5, label = "Střelnej prach" },
                }
            },
            {
                resultitem = "weapon_smg",
                resultlabel = "MP5",
                iconname = "weapon_smg",
                crafttime = 15000,
                reqitems = {
                    { item = "dnj_smgbody", count = 1, label = "Tělo SMG" },
                    { item = "dnj_smgbarrel", count = 1, label = "Barrel pro SMG" },
                    { item = "dnj_spring", count = 15, label = "Pružina" },
                    { item = "dnj_steel", count = 35, label = "Ocel" },
                    { item = "dnj_velcro", count = 1, label = "Suchý zips" },
                    { item = "dnj_pistolpercurssor", count = 3, label = "Pistolový perkusor" },
                    { item = "dnj_gunpowder", count = 5, label = "Střelnej prach" },
                }
            },            
        }
    },

    {
        model = `gr_prop_gr_bench_04b`,
        coords = vec3(739.8603, -784.4055, 26.8392), -- -87.1357, 6520.5015, 31.4907, 226.2729 
        reqjob = false, 
        targetlabel = "Crafting - Attachmenty",
        heading = 1.4329,
        targeticon = "fas fa-gun",
        recipes = {
            {
                resultitem = "at_suppressor",
                resultlabel = "Tlumič",  
                iconname = "at_suppressor",  
                crafttime = 15000,          
                reqitems = {
                  --  { item = "dnj_pistolmagazine", count = 1, label = "Zásobník do zbraně" },
                  --  { item = "dnj_pistolbody", count = 1, label = "Tělo pistolky" },
                 --   { item = "dnj_spring", count = 10, label = "Pružina" },
                  --  { item = "dnj_steel", count = 35, label = "Ocel" }, -- dnj_rope
                    { item = "dnj_rope", count = 15, label = "Lano" },    
                    { item = "dnj_ductape", count = 20, label = "Lepíci páska" },
                    { item = "dnj_velcro", count = 10, label = "Suchý zips" },

                }
            },
            {
                resultitem = "at_clip_extended",
                resultlabel = "Prodloužený zásobník",
                iconname = "at_clip_extended",
                crafttime = 15000,
                reqitems = {
                    { item = "dnj_rope", count = 15, label = "Lano" },    
                    { item = "dnj_ductape", count = 20, label = "Lepíci páska" },
                    { item = "dnj_pistolmagazine", count = 3, label = "Zásobník do zbraně" },
                }
            },
            {
                resultitem = "at_clip_drum",
                resultlabel = "Bubnový zásobník",
                iconname = "at_clip_drum",
                crafttime = 15000,
                reqitems = {
                    { item = "dnj_rope", count = 15, label = "Lano" },    
                    { item = "dnj_ductape", count = 20, label = "Lepíci páska" },
                    { item = "dnj_pistolmagazine", count = 3, label = "Zásobník do zbraně" },
                    { item = "dnj_spring", count = 15, label = "Pružina" },
                    { item = "dnj_steel", count = 35, label = "Ocel" },    

                }
            },            
        }
    },


}