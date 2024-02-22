provider "aws" {
    region = var.region_name
    profile = var.Profile_name
}

variable "region_name" {
    description = "Name of the region"
}

variable "Profile_name" {
    description = "Name of the Profile"
}

variable "Bucket_name" {
    description = "Name of the Bucket"
}


resource "aws_s3_bucket_lifecycle_configuration" "example" {
    bucket = var.Bucket_name
    rule {
        id     = "Delete expired object delete markers or incomplete multipart uploads & Permanently delete noncurrent versions of objects"
        expiration {
            expired_object_delete_marker = "true"
        }
        abort_incomplete_multipart_upload {
            days_after_initiation = 7
        }
        noncurrent_version_expiration {
            noncurrent_days = "1"
        }
        status = "Enabled"
    }
}
