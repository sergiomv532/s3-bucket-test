output "bucket_id" {
  description = "El nombre (ID) del bucket creado."
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "El ARN del bucket creado."
  value       = aws_s3_bucket.this.arn
}