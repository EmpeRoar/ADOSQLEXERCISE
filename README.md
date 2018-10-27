

## Codd’s Rules for an RDBMS

### Rule 1: The Information Principle
> *All information in the relational database is represented in exactly one and only one way—by values in tables.*

### Rule 2: Guaranteed Access
> *Each and every datum (atomic value) is  guaranteed to be logically accessible by resorting to a combination of table name, primary key value, and column name.*

### Rule 3: Systematic Treatment of NULL Values
> *NULL values (distinct from empty character string or a string of blank characters and distinct from zero or any other number) are supported in the fully relational RDBMS for representing missing information in a systematic way, independent of data type.*

### Rule 4: Dynamic Online Catalog Based on the Relational Model
> *The database description is represented at the logical level in the same way as ordinary data, so authorized users can apply the same relational language to its interrogation as they apply to regular data.*

### Rule 5: Comprehensive Data Sublanguage Rule
> *A relational system  may support several languages and various modes of terminal use. However, there must be at least one language whose statements are expressible, per some well-deﬁned syntax, as character strings and whose ability to support all of the following is comprehensible: a. data deﬁnition b. view deﬁnition c. data manipulation (interactive and by program) d. integrity constraints e. authorization f. transaction boundaries (begin, commit, and rollback).*

### Rule 6: View Updating Rule
> *All views that are theoretically updateable are also updateable by the system.*

### Rule 7: High-Level Insert, Update, and Delete
> *The capability of handling a base relation or a derived relation as a single operand applies not only to the retrieval of data but also to the insertion, update, and deletion of data.*

### Rule 9: Logical Data Independence
> *Application programs and terminal activities remain logically unimpaired when information preserving changes of any kind that theoretically permit unimpairment are made to the base tables.*


### Rule 10: Integrity Independence
> *Integrity constraints speciﬁc to a particular relational database must be deﬁnable in the relational data sublanguage and storable in the catalog, not in the application programs.*

### Rule 11: Distribution Independence
> *The data manipulation sublanguage of a relational DBMS must enable application programs and terminal activities to remain logically unimpaired whether and whenever data are physically centralized or distributed.*

### Rule 12: Nonsubversion Rule
> *If a relational system has or supports a low-level (single-record-at-a-time) language, that lowlevel language cannot be used to subvert or bypass the integrity rules or constraints expressed in the higher-level (multiple-records-at-a-time) relational language.*







