resource "google_service_account" "ServiceAccounnt" {
  account_id   = "gcp-terraform-serviceaccount"
  display_name = "Service Account"
}
resource "google_project_iam_member" "ServiceAccounnt-binding" {
  project = "iti-42-ahmed"
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.ServiceAccounnt.email}"
}