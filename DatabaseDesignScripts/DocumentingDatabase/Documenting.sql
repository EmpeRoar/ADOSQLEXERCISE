--Messages schema 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'Messaging objects', 
	@level0type = 'Schema', @level0name = 'Messages';

--Messages.Topic table 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = ' Pre-deﬁned topics for messages', 
	@level0type = 'Schema', @level0name = 'Messages', 
	@level1type = 'Table', @level1name = 'Topic';

--Messages.Topic.TopicId 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'Surrogate key representing a Topic', 
	@level0type = 'Schema', @level0name = 'Messages', 
	@level1type = 'Table', @level1name = 'Topic', 
	@level2type = 'Column', @level2name = 'TopicId';

--Messages.Topic.Name 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'The name of the topic', 
	@level0type = 'Schema', @level0name = 'Messages', 
	@level1type = 'Table', @level1name = 'Topic', 
	@level2type = 'Column', @level2name = 'Name';

--Messages.Topic.Description 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'Description of the purpose and utilization of the topics', 
	@level0type = 'Schema', @level0name = 'Messages', 
	@level1type = 'Table', @level1name = 'Topic', 
	@level2type = 'Column', @level2name = 'Description';

--Messages.Topic.RowCreateTime 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'Time when the row was created', 
	@level0type = 'Schema', @level0name = 'Messages',
	@level1type = 'Table', @level1name = 'Topic', 
	@level2type = 'Column', @level2name = 'RowCreateTime';

--Messages.Topic.RowLastUpdateTime 
EXEC sp_addextendedproperty @name = 'Description', 
	@value = 'Time when the row was last updated', 
	@level0type = 'Schema', @level0name = 'Messages', 
	@level1type = 'Table', @level1name = 'Topic', 
	@level2type = 'Column', @level2name = 'RowLastUpdateTime';
