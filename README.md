# 👩‍💼 HR Data SQL Analysis  

This project focuses on analyzing **HR employee data** using SQL.  
It covers key HR analytics like **attrition rate, salary distribution, employee demographics, performance, and workforce insights**.  

---

## 📌 Project Overview  
HR data plays a critical role in understanding workforce trends.  
Using SQL, this project explores:  

- Workforce size and demographics  
- Employee tenure and attrition  
- Salary distributions and department-level insights  
- Performance analysis  
- Termination causes and employment status  

---

## 🗄️ Dataset Structure  

The database `hrdata` contains one main table:  

### **Employees Table**  
- `EmpID` – Unique employee ID  
- `FullName` – Employee name  
- `Gender` – Gender of the employee  
- `DOB` – Date of birth  
- `DateofHire` – Joining date  
- `DateofTermination` – Exit date (or "CurrentlyWorking")  
- `Department` – Employee’s department  
- `Position` – Job role/position  
- `ManagerName` – Reporting manager  
- `Salary` – Employee salary  
- `PerformanceScore` – Last performance review rating  
- `MaritalDesc` – Marital status  
- `State` – Employee location  
- `TermReason` – Reason for termination  
- `LastPerformanceReview_Date` – Date of last performance review  

---

## 🔎 Key Analysis Areas  

### 👥 Workforce Metrics  
- Total employees, active vs. terminated employees  
- Average salary, average age, and average tenure  
- Attrition rate (%)  

### 💰 Salary Analysis  
- Salary distribution across ranges (`<30K`, `30K–49K`, …, `90K+`)  
- Department-wise average salary  

### 🏢 Department & Role Insights  
- Employee count per **department, position, and manager**  
- Department-wise salary comparison  

### 📊 Employee Demographics  
- Gender distribution  
- Marital status breakdown  
- State-wise employee distribution  
- Age distribution (`<20`, `20–29`, …, `60+`)  

### 📈 Performance & Termination  
- Count of employees by performance score  
- Termination reasons and their frequency  

---

## 🚀 Outcomes  
By running these SQL queries, HR teams can:  

- Track **headcount, attrition, and workforce trends**  
- Analyze **salary structures** for pay equity and budgeting  
- Identify **departments with high or low average salaries**  
- Understand **demographics** like age, gender, and marital status  
- Discover **common termination reasons** for retention planning  
- Monitor **employee performance distribution**  

---

## 🛠️ Tools & Technologies  
- **SQL (MySQL)** – Querying and analysis  
- **HR Employee Dataset** – Employee records in CSV → imported into MySQL  

---

## 📌 How to Use  
1. Import the HR dataset (`employees.csv`) into MySQL under the database `hrdata`.  
2. Run the provided SQL queries step by step.  
3. Explore additional queries for custom HR analytics.  
