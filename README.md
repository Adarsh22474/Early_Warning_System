
# Early Warning System (EWS) Dashboard

## 📌 Project Overview
This project builds a **3-page Early Warning System (EWS) dashboard** in **Power BI** to analyze customer risk and default patterns.  
The goal is to use data-driven insights to flag high-risk customers, understand drivers of default, and enable targeted risk management.  

---

## 🛠 Tools & Technologies
- **Power BI** – Dashboard development & visualization  
- **Excel** – Data cleaning and preprocessing  
- **SQL** – Querying and transformations  

---

## 📂 Project Structure
- **data/** – Raw and cleaned datasets (Excel/CSV)  
- **sql/** – SQL scripts used for analysis  
- **dashboard/** – Power BI file (`EWS_Dashboard.pbix`)  
- **images/** – Dashboard screenshots  

---

## 📊 Dashboard Preview

This dashboard has **3 pages**, each focusing on a specific aspect of customer risk analysis.  

---

### 📍 Page 1 – Risk Warning Overview
**Visuals:** Pie chart · Bar chart · Line chart (dual axis) · KPI card  

**Insights:**  
- Majority of customers fall in **Amber (57%)**, followed by **Green (25%)** and **Red (16%)**.  
- **Default rate** is highest in **Red (57%)**, medium in **Amber (4%)**, and negligible in **Green (0%)**.  
- Overall default rate is **20%**, driven mainly by Red customers.  

**Message:**  
EWS flags effectively distinguish risk groups:  
- 🔴 Red = alarming  
- 🟡 Amber = watchlist  
- 🟢 Green = safe  

images/EWS Dashboard Page 1.png

---

### 📍 Page 2 – Education and Warning Flag Analysis
**Visuals:** Matrix heatmap · Stacked bar chart · Tree map  

**Insights:**  
- **Bachelor’s & High School customers** in Red bucket show the highest default rates (**0.57–0.61**).  
- **PhD and Master’s customers** show low defaults, even when flagged Red.  
- Tree map shows Red dominates across all education levels, but risk is concentrated in **lower education groups**.  

**Message:**  
Education strongly influences risk.  
👉 Risk management should focus on **Bachelor’s & High School customers in Red**.  

images/EWS Dashboard Page 2.png

---

### 📍 Page 3 – Risky Customers Analysis
**Visuals:** Scatter plot · Tree map  

**Insights:**  
- Scatter plot shows **debt–income ratio increases with income** → high income ≠ safe.  
- Defaults often occur due to **debt burden, not income level**.  
- Tree map highlights **specific high-risk customers (IDs: 1019, 1001, 1049, etc.)** for drill-down.  

**Message:**  
Risk is driven by **financial behavior (debt vs income)**, not just demographics.  
👉 High-income customers with high debt ratios are also **high-risk**.  

images/EWS Dashboard Page 3.png

---

## 🔑 Key Insights Summary
- **Red-flagged customers** are the biggest risk contributors (57% default rate).  
- **Education matters** – lower education groups in Red are highest risk.  
- **High income ≠ low risk** – debt burden is a stronger driver of default.  
- The **EWS framework works well** for identifying and segmenting risky customers.  

---

## 🚀 How to Use
1. Explore queries in **/sql/queries.sql**  
2. Open `dashboard/EWS_Dashboard.pbix` in **Power BI Desktop**  
3. Review Excel reports in **/data**  
4. View dashboard screenshots in **/images**  

---

## 📫 Contact
- LinkedIn: www.linkedin.com/in/adarsh-gupta-7228341b3  
- Email: adarsh346@gmail.com  

