#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd

echo "
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Your AWS Website</title>
</head>
<body style='font-family: Arial; text-align: center; padding: 40px; background: #f7f7f7;'>
<h1>🌐 Welcome to your first website on AWS using EC2 (Linux)!</h1>

<h2>✨ Thank You for Learning with <span style='color:#ff6600;'>Sudeshana Waykar</span>!</h2>

<p>Your cloud journey matters — and I’m truly glad to be a part of it. ☁️🚀</p>

<p>Stay connected and keep growing!</p>

<p><strong>LinkedIn:</strong> <a href='https://www.linkedin.com/in/sudeshanawaykar' target='_blank'>https://www.linkedin.com/in/sudeshanawaykar/</a></p>

<h3>🌟 Let’s continue learning, building, and achieving together!</h3>
</body>
</html>
" | sudo tee /var/www/html/index.html
sudo chown -R apache:apache /var/www/html

echo "Website installed successfully ✅"
