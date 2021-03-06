*init:sound track*
<https://www.youtube.com/watch?v=Ds8S7fIbxUg

### Edgar F Codd :sunglasses:
*Wrote the paper 'A Relational Model of Data For Large Shared Data Banks'*


### Trivia:
- Regular Integer Maximum Value :  2,147,483,647 
- Explain **_Spacial Types_** and uses.
- What are **_Metadata_**.
- **_Keys_** usually referred to as a candidate key.

### RoadMap:
- Conceptual
- Logical
- Physical
- Storage


### Speciﬁcations need to be acquired for the following
- Entities and relationships
- Attributes and domains
- Business rules that can be enforced in the database
- Processes that require the use of the database


### IDEFX-DATA Modeling
> http://www.idef.com/idef1x-data-modeling-method/ <br/> 
> https://www.nist.gov/itl (search for *IDEF1X*)


### Ask the right Questions
- What Data Is Needed?
- How Will the Data Be Used?
- What Rules Govern the Use of the Data?
- What Data Is Reported On?
- Where Is the Data Now?
- Will the Data Need to Be Integrated with Other Systems?
- How Much Is his Data Worth?
- Who Will Use the Data?




### Database Gurus
http://www.dbdebunk.com/

## _Search for the BEST data modeling tool_


## Data Model Production
- Identifying entities
- Identifying relationships between entities
- Identifying attributes and domains
- Identifying business rules
- Identifying fundamental processes

## Entities _(nouns)_
- People
- Place
- Object
- Idea _( a document, insurance, group, list of services provided )_

## Normalization
### 1. First Normal Form
> Every row should contain the same number of values, or in other words, no arrays, subtables, or repeating groups.
### 2. 

### Data Modeling
> https://www.youtube.com/watch?v=A1A_ag-Fh8M <br/>
> https://www.youtube.com/watch?v=QpdhBUYk7Kk <br/>
> https://www.youtube.com/watch?v=B5r8CcTUs5Y <br />
> https://channel9.msdn.com/events/Build/2016/P468?term=data%20modeling&lang-en=true <br/>
> https://mva.microsoft.com/en-US/training-courses/8441?l=hzsFp0Vz_7504984382 <br/>
> https://channel9.msdn.com/events/Microsoft-Data-Insights-Summit/2016/BRE003?term=data%20modeling&lang-en=true

### Reserved Keywors
> https://docs.microsoft.com/en-us/sql/t-sql/language-elements/reserved-keywords-transact-sql?view=sql-server-2017

### Performance
> https://sqlserverperformance.wordpress.com/

### Indexes
> https://docs.microsoft.com/en-us/ef/core/modeling/indexes

### Unique Constraint
> https://www.thereformedprogrammer.net/entity-framework-core-validating-data-and-catching-sql-errors/

### More Resources
> https://github.com/apress/pro-ef-core-2-for-asp.net-core-mvc

> <DotNetCliToolReference Include="Microsoft.Extensions.Caching.SqlConfig.Tools" Version="2.0.0" /> 

```csharp
 services.AddDistributedSqlServerCache(options => {                
    options.ConnectionString = conString;                
    options.SchemaName = "dbo";                
    options.TableName = "SessionData";            
});            
services.AddSession(options => {                
    options.Cookie.Name = "ProjectName.Session";                
    options.IdleTimeout = System.TimeSpan.FromHours(48);                
    options.Cookie.HttpOnly = false;            
}); 
```

### EF Core RelationShip / Model Building
```csharp
 modelBuilder.Entity<Employee>()                
     .Property(e => e.Id).ForSqlServerUseSequenceHiLo();

//modelBuilder.Entity<Employee>()            
//   .HasIndex(e => e.SSN).HasName("SSNIndex").IsUnique();

modelBuilder.Entity<Employee>()
     .HasAlternateKey(e => e.SSN);

 modelBuilder.Entity<SecondaryIdentity>()                
     .HasOne(s => s.PrimaryIdentity)                
     .WithOne(e => e.OtherIdentity)                
     .HasPrincipalKey<Employee>(e => e.SSN)                
     .HasForeignKey<SecondaryIdentity>(s => s.PrimarySSN); 

// ------------------------------------------------------------------

protected override void OnModelCreating(ModelBuilder modelBuilder) {

	modelBuilder.Entity<Employee>().Ignore(e => e.Id);            
	modelBuilder.Entity<Employee>().HasKey(e => e.SSN);
	
	modelBuilder.Entity<SecondaryIdentity>()                
				.HasOne(s => s.PrimaryIdentity)                
				.WithOne(e => e.OtherIdentity)                
				.HasPrincipalKey<Employee>(e => e.SSN)                
				.HasForeignKey<SecondaryIdentity>(s => s.PrimarySSN);
				
}      
```
### Query EF
```csharp
 public class HomeController : Controller {        
 	private AdvancedContext context;
        private static Func<AdvancedContext, string, IEnumerable<Employee>> query = 
		EF.CompileQuery((AdvancedContext context, string searchTerm) => 
		context.Employees.Where(e => EF.Functions.Like(e.FirstName, searchTerm)));
		
        public HomeController(AdvancedContext ctx) => context = ctx;
        
	public IActionResult Index(string searchTerm) {            
		return View(string.IsNullOrEmpty(searchTerm ) ? 
				context.Employees : 
				query(context, searchTerm));        
	}
        // ...other action methods omitted for brevity...    } 
```


### TSQL Playbook
https://gist.github.com/EmpeRoar/6fc54eaa8b1be3f84926
