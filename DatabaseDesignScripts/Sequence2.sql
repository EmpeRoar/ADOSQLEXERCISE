DECLARE @range_ﬁrst_value sql_variant, @range_last_value sql_variant, 
		@sequence_increment sql_variant;

EXEC  sp_sequence_get_range @sequence_name = N'Messages.TopicIdGenerator' 
	  , @range_size = 100 
	  , @range_ﬁrst_value = @range_ﬁrst_value OUTPUT 
	  , @range_last_value = @range_last_value OUTPUT 
	  , @sequence_increment = @sequence_increment OUTPUT;
SELECT CAST(@range_ﬁrst_value as int) as ﬁrstTopicId, 
	   CAST(@range_last_value as int) as lastTopicId, 
	   CAST(@sequence_increment as int) as increment;


-- If you want to get metadata about the sequences in the database, you can use the sys.sequences catalog view.
SELECT start_value, increment, current_value 
FROM  sys.sequences 
WHERE scheama_name(schema_id) = 'Messages' 
AND  name = 'TopicIdGenerator';




