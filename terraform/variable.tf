variable "PUID" {
  type = string
  description = "default user id, find with: id $USER"
  default = "1000"
}

variable "PGID" {
  type = string
  description = "default group id, find with: id $USER"
  default = "1000"
}

variable "TZ" {
  type = string
  description = "Your timezone, https://en.wikipedia.org/wiki/List_of_tz_database_time_zones"
  default = "America/Los_Angeles"
}

variable "ROOT" {
  type = string
  description = "The directory where data will be stored"
  default = "/home/marchah/Plex"
}

variable "CONFIG" {
  type = string
  description = "The directory where configurations will be stored"
  default = "/home/marchah/htpc"
}