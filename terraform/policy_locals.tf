locals {
    iam_trust_policy = jsonencode({
        "Version":"2012-10-17",		 	 	 
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": [
                "ec2.amazonaws.com",
                ]
            },
            "Action": "sts:AssumeRole"
            }
        ]
    })
}

locals {
    iam_s3_operation_policy = jsonencode({
    "Version":"2012-10-17",		 	 	 
    "Statement": [
        {
            "Sid": "OperationAccess",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket", 
                "s3:DeleteBucket", 
                "s3:ListBucket", 
                "s3:ListBucket", 
                "s3:GetObject",
            ],
            "Resource": [
                "arn:aws:s3:::general-*/*",
                "arn:aws:s3:::general-*",
                ]
        },
    ]
    })
}


locals {
    iam_rds_operation_policy = jsonencode({
    "Version":"2012-10-17",		 	 	 
    "Statement": [
        {
            "Sid": "OperationAccess",
            "Effect": "Allow",
            "Action": [
                
            ],
            "Resource": [
                "arn:aws:s3:::general-*/*",
                "arn:aws:s3:::general-*",
                ]
        },
    ]
    })
}