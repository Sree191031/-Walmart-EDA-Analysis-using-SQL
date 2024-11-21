# Walmart Sales Analysis

### Project Overview

Walmart Inc., established in 1962 by Sam Walton in Rogers, Arkansas, is a leading American multinational retail corporation. It operates a vast network of hypermarkets, discount department stores, and grocery outlets across the United States and internationally.

Enable a data-driven approach for understanding customer behavior, optimizing marketing strategies, enhancing customer retention, and driving revenue growth through precise analytics and actionable insights

**Business Strategy Insights**

**1. Customer Life Time Value**
Predicted long-term value of customers to prioritize retention strategies and boost profitability.

**2. Customer Segmentation Analysis**
Classified customers based on demographics such as age, gender, occupation, and marital status to personalize engagement and optimize product offerings.

**3. Gender Based Analysis**
Quantified male and female contributions to overall revenue, total products sold, and user purchase count, enabling targeted marketing strategies.

**4. Product Popularity Analysis**
Ranked products by sales performance, identifying the Top 10 items for specific age groups and the Top 50 most likely to be purchased products.

**5. Market Basket Analysis**
Leveraged purchase patterns to identify frequently bought-together products, optimizing cross-selling and upselling strategies.

**6. Reorder Purchase Analysis**
Measured reorder rates by product ID and category, helping identify consistent performers and products requiring stock level adjustments.

**7.Price Sensitivity Analysis**
Assessed customer response to price changes, optimizing pricing strategies to maximize revenue and retain price-sensitive customers.

**8. Average Purchase Value Analysis**
Calculated the average value of customer transactions to understand spending behavior and enhance promotional efforts.

---
### Dataset Overview

**Data Structure**


The dataset is sourced from Kaggle's e-Commerce (Walmart) Sales Dataset and consists of numerical data points, such as occupation and product categories, with values ranging between 0 and 20.

A data model was designed in Power BI, showcasing relationships and key metrics, as illustrated in the shared diagram. 

<div align="center">
  <img src="https://github.com/Sree191031/Walmart-Analysis-SQL---PowerBI/blob/main/Data%20Modeling.png" width="640" height="360" />
</div>


The dataset has dimensions of (10, 556,012). The data was read, loaded into SQL, and analyzed using the mentioned metrics to uncover patterns and derive actionable insights

---
### Excutive Summary 

#### Customer and Product Insights
- **Top 50 Users for Each Product**: Identified loyal customers contributing to consistent revenue, suggesting the potential for personalized offers or loyalty programs.  
- **Category Popularity**: High-performing categories and products are evident, offering a focus area for promotional activities and product recommendations.
  
#### Gender-Based Sales Analysis
- **Total Sales Contribution**: Gender-based analysis reveals **172K total sales**, segmented across male and female buyers.  
- **Demographics**:  
  - Female customers account for **64.22%**, while male customers contribute **35.78%**, indicating a stronger engagement from the female demographic.  
  - Gender-specific product preferences are noticeable in product categories, offering opportunities for gender-focused marketing.  
- **Occupational Insights**:  
  - A breakdown of sales by occupation identifies key contributors and highlights professional categories that drive purchases.  
- **Age Group Trends**:  
  - Different age segments (e.g., **18–25**, **26–35**) display unique purchasing behaviors, which can be leveraged for age-targeted marketing campaigns.

 
![Dashboard Image](https://github.com/Sree191031/Walmart-Analysis-SQL---PowerBI/blob/main/Gender%20Sales%20Analysis.png)

#### Sales Performance Analysis

- **Total Sales Volume**: Achieved a cumulative purchase value of **5 billion**, reflecting robust overall performance.
- **Product Engagement**: Recorded **550.068K product counts**, showcasing significant customer interaction with the available inventory.  
- **Average Sales**: Maintained an average sales value of **9.26K**, highlighting consistent customer spending patterns.  
- **Sales by Category**:  
  - Certain categories contribute a higher percentage to total sales, with clear differentiation across the sales distribution.  
- **City-wise Performance**:  
  - Categories exhibit varying performance levels across cities, with distinct purchasing trends in regions classified as A, B, and C categories.  

![Dashboard Image](https://github.com/Sree191031/Walmart-Analysis-SQL---PowerBI/blob/main/Sales%20Dashboard.png)

 ---   
### Business KPIs Overview

This project focuses on analyzing key business performance metrics to optimize sales,average sales,user count, and Product purchase count. Below are the key performance indicators (KPIs) being tracked:

**1. **Total Sales****
The aggregate revenue from all transactions, indicating overall financial performance and market demand.

**2. **Average Sales****
The mean revenue per transaction, helping assess pricing strategies and sales efficiency.

**3. **Number of Prdoucts Sold****
The total quantity of products sold, reflecting inventory turnover and demand trends.

**4. **Number of user purchase specfic product_category****
The average customer satisfaction score, indicating product quality and customer loyalty.

#### Strategic Implications

- **Personalization**: Insights into demographics, including age, gender, and occupation, offer opportunities for targeted marketing strategies.  
- **Regional Optimization**: City-wise sales patterns reveal potential areas for region-specific campaigns.  
- **Customer Engagement**: Identifying high-value customers and analyzing their behavior aids in retention and cross-selling efforts.
---
### Recommendations

### 1. Cross-Selling and Upselling Strategies
- **Target Top 10 Products**:
  - Focus on products with the highest frequency count that contribute **10% of total revenue**.
  - Devise **bundling strategies** by pairing these products with complementary items frequently purchased together.
  - Use **personalized recommendations** based on customer purchase history to promote upselling of premium variants or additional units of these products.

- **Promotion Tactics**:
  - Offer **discounted bundles** on these top-performing products during peak shopping periods.
  - Highlight "Frequently Bought Together" combinations in online and in-store displays to encourage cross-selling.

---

### 2. Product Categories by Gender Insights
- **Focus on High Purchase Categories**:
  - Categories **1, 5, and 8** show the highest purchase counts.
  - For **Female Customers**:
    - Promote products within these categories via **email campaigns, social media ads**, and in-store promotions targeted at female shoppers.
    - Highlight gender-preferred features, such as style, utility, or affordability, in marketing materials.
  - For **Male Customers**:
    - Leverage data to offer targeted promotions on male-dominant product categories.
    - Use loyalty programs to encourage repeat purchases within these segments.

---

### 3. Reward System for Loyal Customers
- **Target Top 10-25 Customers**:
  - Create a **tier-based loyalty program** rewarding frequent and high-value customers.
  - Offer **exclusive benefits** like:
    - Early access to sales or new products.
    - Discounts or cashback rewards for repeat purchases.
    - Free shipping or gift vouchers.
  - Use the program as a tool to encourage churned customers to re-engage by providing personalized offers or bonus points for their next purchase.

- **Customer Retention Tactics**:
  - Periodically analyze customer purchasing trends to update reward tiers and incentives.
  - Send personalized thank-you messages or exclusive deals for milestones achieved in the loyalty program.

---

### 4. Marketing Strategies for Age Group 25-35
- **Key Insights**:
  - The **25-35 age group** contributes the highest percentage of total revenue.  
  - Tailor marketing campaigns to appeal to this demographic’s preferences:
    - Highlight products that fit their lifestyle, such as convenience, affordability, and premium features.
  - Leverage **social media platforms** like Instagram, Facebook, and TikTok, where this age group is most active.

- **Campaign Ideas**:
  - Run campaigns like “Flash Sales” or “Special Deals” targeting this segment.
  - Partner with influencers or brand ambassadors who resonate with the 25-35 demographic.
  - Offer **subscription-based models** or recurring discounts on products frequently purchased by this group.

- **Omnichannel Marketing**:
  - Combine digital marketing with in-store promotions to maximize engagement.
  - Use **data-driven advertising** to target their browsing and shopping habits on e-commerce platforms.

---

### Conclusion
Implementing these strategies will boost revenue, improve customer retention, and optimize marketing efforts. Regularly monitor performance metrics and refine these recommendations for continuous improvement.
