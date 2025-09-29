terraform {
  backend "azurerm" {
    resource_group_name  = "teaf4"
    storage_account_name = "teafstorageacc"   # اسم Storage موجود فعلاً
    container_name       = "teafcon"           # لازم يكون مُنشأ داخل الـStorage
    key                  = "project1/terraform.tfstate"
  }
}
