

# Navigate to terraform directory
cd terraform/

echo ""
echo "Step 1: Terraform Init"
terraform init

echo ""
echo "Step 2: Terraform Plan"
terraform plan -out=tfplan

echo ""
echo "Step 3: Terraform Apply"
terraform apply tfplan
