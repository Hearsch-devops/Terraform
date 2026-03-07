resource "aws_s3_bucket" "myS3bucket" {

    for_each = {
        dev = "dapp-s3bucket"
        stg = "stgapp-s3bucket"
        prod = "prd-s3bucket"
    }

    bucket = "${each.key}-${each.value}"
    #acl = "private"

    tags = {
        eachvalue = each.value
        environment = each.key
        bucketname = "${each.key}-${each.value}"
    }

}
