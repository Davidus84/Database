select FirstName, LastName, Start_date, MobilePhone
from 	SalesAssociate, SalesAssociatePrimaryPhoneNumber, SalesAssociateHistory
where sah.EmploymentStatus = 'Department Manager' or sah.EmploymentStatus = 'Store Manager' and sah.Termination_code = null;