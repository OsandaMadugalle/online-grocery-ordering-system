<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin List</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1b1b2f, #162447);
            color: white;
            text-align: center;
            padding-top: 50px;
        }
        .container {
            width: 80%;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        .btn-add {
            background: #ff4c29;
            color: white;
            font-weight: 600;
            border-radius: 8px;
        }
        .btn-add:hover { background: #e03e1a; 
        }
        .table { color: white; 
        }
        .btn { font-size: 14px; 
        }
        .home-icon {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 28px;
            color: white;
            text-decoration: none;
        }
        .home-icon:hover {
            color: #ddd;
        }
    </style>
</head>

<body>

    <!-- Back Button -->
    <a href="adminAccount.jsp" class="home-icon">
        <i class="fas fa-arrow-left"></i>
    </a>

    <div class="container">
        <h3>Admin List</h3>
        <a href="createAdmin.jsp" class="btn btn-add">Add New Admin</a>
        <table class="table table-dark table-striped mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                    <td>#</td>
                    <td>
                        <a href="admin_form.jsp?id=#" class="btn btn-warning">Edit</a>
                        <a href="DeleteAdminServlet?id=#" class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
