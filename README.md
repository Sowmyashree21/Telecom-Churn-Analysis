# Telecom Customer Churn Analysis (SQL + Power BI + Machine Learning)

## Overview
This project is an **end-to-end churn analysis system** that integrates **SQL** for backend data preparation, **Power BI** for visualization, and **Machine Learning** for predictive insights.  

The main objective is to simulate a real-world business case where companies want to understand **why customers leave (churn)** and proactively reduce churn by identifying at-risk customers.

Designed as a portfolio project, it demonstrates how a data analyst can combine **data engineering, business intelligence, and predictive modeling** into one unified solution.

---

## Project Objectives
- Measure and track **overall churn rate** with KPIs and dashboards.
- Identify patterns behind churn across demographics, billing, and contract details.
- Analyze services and behaviors linked to higher churn.
- Use **Machine Learning (Random Forest)** to predict churn likelihood for each customer.
- Build dashboards to help stakeholders take **data-driven retention actions**.

---

## Tools & Technologies
- **MySQL Workbench** – Data cleaning, transformations and KPI calculation.
- **Power BI** – Interactive dashboards, filters and AI Smart Narratives.
- **Python (Jupyter Notebook)** – Machine learning using Random Forest.
- **Scikit-learn, Pandas, Numpy, Matplotlib, Seaborn, Joblib** – Model training, evaluation and prediction.
- **Excel/CSV** – For intermediate data storage and integration with Power BI.
- **GitHub** – Documentation and version control.

---

## Dataset Summary
The dataset represents customer-level subscription data, including demographics, services, and billing. Key fields include:

- **Customer_ID** – Unique customer identifier  
- **Customer_Status** – Whether the customer stayed or churned  
- **Demographics** – Gender, Age, Marital Status, Senior Citizen  
- **Services** – Phone, Internet, Streaming, Online Security, etc.  
- **Billing & Account** – Contract Type, Tenure, Payment Method, Monthly Charges, Total Revenue  
- **Churn Details** – Churn Category, Churn Reason  

These attributes mirror real-world telecom/retail data used for churn analysis.

---

## SQL Analysis
### Core KPIs
- **Total Customers**: 6418  
- **Total Churned Customers**: 1732  
- **New Joiners (Recent Period)**: 411  
- **Churn Rate**: 27%  

## SQL Analysis

The backend of this project was built in **SQL Server**, where raw churn data was cleaned, transformed, and structured for analysis in Power BI and Machine Learning.

### Database Setup
Performed data cleaning and transformations:
 - Removed nulls and standardized categorical values.
 - Verified column data types for consistency.

### Production Tables & Views
- Created a **production-ready table**: **`customer_new`** to store cleaned data.
- Built SQL **views** to simplify reporting and ML integration:
  - **`vw_ChurnData`** – for customer churn metrics and KPIs.  
  - **`vw_JoinData`** – for preparing new data inputs for the prediction model. 
---

## Power BI Dashboard Overview
Before building dashboards, the dataset was modeled and transformed in Power BI. Key steps included:

**Data Transformations**
  - Created **Age Groups** (e.g., `<20`, `21–35`, `36–50`, `>50`).
  - Defined **Tenure Groups** (e.g., `<6`, `6–12`, `12–18`, `18–24`, `>24` months).
  - Cleaned column formats.

**DAX Measures**
  - **Total Customers**  
  - **Total Churned Customers**  
  - **Churn Rate** = Churned Customers ÷ Total Customers  
  - **New Joiners**  
 
These measures provided the backbone for KPIs and allowed month-over-month comparisons.

### Dashboard 1: **Summary**
This high-level dashboard was built for quick decision-making and includes:

- **KPI Cards** for Total Customers, Churned Customers, Churn Rate, and New Joiners.  
- **Visual Comparisons** across age groups, gender, tenure, and contract types.  
- **Slicers** for:
  - **Marital Status** → to filter churn behavior by family status.  
  - **Monthly Charge Range** → to analyze churn across billing segments.
- **Navigation Buttons** were added, enabling users to move seamlessly between the **Summary Dashboard** and the **Prediction Dashboard**.

 <img width="1126" height="639" alt="image" src="https://github.com/user-attachments/assets/cf5e6d81-c762-4110-be75-1cbc0818805d" />


### Dashboard 2: **Prediction Insights**
This dashboard highlights **at-risk customers** identified by the machine learning model:

- **KPI Cards** for Predicted Churners and Gender Split.  
- **Visual Comparisons** across age groups, tenure, marital status, contract type, payment method, and states.  
- **Key Insights**:
  - Most predicted churners are **21–50 years old** and have **<12 months tenure**.  
  - Majority are on **Month-to-Month contracts** and use **Credit Card or Bank Withdrawal** payment methods.  
  - **Gender Split**: 246 Female vs. 132 Male; **Marital Status** nearly even.  
  - **Geography**: Highest churn in **Uttar Pradesh, Maharashtra, Tamil Nadu, Karnataka, and Bihar**.  
- **Navigation Buttons** allow users to move back to the **Summary Dashboard**.
 
<img width="1125" height="637" alt="image" src="https://github.com/user-attachments/assets/f64ed35a-366f-4b75-9b47-efd7f3ef0590" />

---

## Machine Learning Integration
The ML component was built in **Python (Jupyter Notebook)** using **Random Forest**.

### Steps:
1. **Data Preprocessing**  
   - Dropped unused fields (e.g., Customer_ID, Churn_Reason).  
   - Label encoded categorical variables.  
   - Encoded target variable: *Stayed (0), Churned (1)*.  

2. **Model Training**  
   - Train/Test Split: 80/20.  
   - Model: RandomForestClassifier (100 trees).  
   - Evaluation: Confusion Matrix + Classification Report.  

3. **Feature Importance**  
   - Visualized key drivers of churn (tenure, contract type, services).  

4. **Predictions on New Data**  
   - Used `vw_JoinData` for fresh predictions.  
   - Predicted churners were flagged and exported to CSV.  
   - Results integrated back into Power BI dashboard.  

### Key Result  
- **Predicted Churners**: 378  
- Majority were **month-to-month contract users** with higher monthly charges.  

---

## Key Business Questions Answered
- What is the overall churn rate and how has it changed over time?  
- Which demographics are more likely to churn (age, gender, marital status)?  
- How do contract types and payment methods affect churn?  
- Which services are associated with higher churn (internet, streaming, etc.)?  
- What are the top churn reasons cited by customers?  
- Can we predict future churners before they leave?  

---

## Key Takeaways
- Gained hands-on practice with **ETL workflows in SQL**.  
- Built **interactive Power BI dashboards** with advanced filters and narratives.  
- Applied **machine learning (Random Forest)** for customer churn prediction.  
- Learned how to **integrate ML results into BI dashboards** for stakeholders.  
- Strengthened ability to bridge **business needs with data insights**.  

---

## About Me
I am an aspiring data analyst passionate about solving real-world business problems using data.  

This project gave me the opportunity to combine **data engineering, BI reporting, and machine learning** into one solution, simulating how analytics is applied in real organizations.  

I look forward to building more projects that integrate **data visualization and predictive analytics** to support business decisions.  

---
