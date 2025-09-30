# Online Grocery Ordering System

A full-stack web application for online grocery shopping, developed as a personal project to demonstrate my skills in Java web development, SQL, and software architecture.

---

## 🚀 Features

- Product catalog with dynamic category browsing
- Shopping cart with quantity management
- User registration and authentication
- Order placement and tracking
- Admin dashboard for inventory, products, and delivery personnel management
- Inventory manager role to oversee stock and product data
- Responsive UI (Bootstrap framework)
- SQL database schema included (`gos.sql`)

---

## 🛠️ Technologies Used

- **Java (JSP/Servlets)**
- **MySQL** (database, schema in `gos.sql`)
- **Apache Tomcat 9** (deployment)
- **Bootstrap** (responsive front-end)
- **HTML/CSS/JavaScript**

---

## ⚡ Quick Start

1. **Clone the Repository**
   ```bash
   git clone https://github.com/OsandaMadugalle/online-grocery-ordering-system.git
   cd online-grocery-ordering-system
   ```
2. **Database Setup**
   ```bash
   mysql -u yourusername -p gos < gos.sql
   ```
   Update credentials in `src/main/java/com/gos/util/ConnectionData.java`.
3. **Deploy**
   - Import into your Java IDE or build tool.
   - Deploy to Tomcat 9.
   - Access at `http://localhost:8080/online-grocery-ordering-system`

---

## 📁 Project Structure

- `src/main/webapp/webContent/` — User-facing JSPs
- `src/main/webapp/customer/` — Customer and admin panels
- `src/main/java/com/gos/` — Backend logic (models, services)
- `gos.sql` — Database schema

---

## 👨‍💻 About Me

I'm Osanda Madugalle, a passionate Java developer focused on building robust and user-friendly web applications. This project reflects my hands-on experience in backend, database, and UI integration.

**GitHub:** [@OsandaMadugalle](https://github.com/OsandaMadugalle)

---

**This project is for demonstration purposes for internship applications.**