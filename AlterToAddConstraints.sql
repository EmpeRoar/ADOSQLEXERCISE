ALTER TABLE Music.Artist WITH CHECK 
	ADD CONSTRAINT chkMusic_Artist$Name$NoPetShopNames   
		CHECK (Name not like '%Pet%Shop%');
