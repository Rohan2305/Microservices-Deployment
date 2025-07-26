# 1. Update package index
sudo apt update

# 2. Install Java (Jenkins requires Java 11+; you're using OpenJDK 21)
sudo apt install -y fontconfig openjdk-21-jre

# 3. Verify Java installation
java -version

# 4. Add Jenkins GPG key
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# 5. Add Jenkins repository to your sources
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# 6. Update again to include Jenkins packages
sudo apt update

# 7. Install Jenkins
sudo apt install -y jenkins

# 8. Start and enable Jenkins service
sudo systemctl daemon-reexec
sudo systemctl enable jenkins
sudo systemctl start jenkins

# 9. Check Jenkins status
sudo systemctl status jenkins

