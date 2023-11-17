class Job {
  String? employerName;
  String? employerLogo;
  String? jobPublisher;
  String? jobEmploymentType;
  String? jobTitle;
  String? jobApplyLink;
  bool? jobApplyIsDirect;
  String? jobDescription;
  bool? jobIsRemote;
  String? jobPostedAtDatetimeUtc;
  String? jobCity;
  String? jobState;
  String? jobCountry;
  double? jobLatitude;
  double? jobLongitude;
  String? jobGoogleLink;
  String? jobOfferExpirationDatetimeUtc;
  int? jobOfferExpirationTimestamp;
  int? jobMinSalary;
  int? jobMaxSalary;
  String? jobSalaryCurrency;
  String? jobSalaryPeriod;
  String? jobPostingLanguage;
  Job({
    this.employerName,
    this.employerLogo,
    this.jobPublisher,
    this.jobEmploymentType,
    this.jobTitle,
    this.jobApplyLink,
    this.jobApplyIsDirect,
    this.jobDescription,
    this.jobIsRemote,
    this.jobPostedAtDatetimeUtc,
    this.jobCity,
    this.jobState,
    this.jobCountry,
    this.jobLatitude,
    this.jobLongitude,
    this.jobGoogleLink,
    this.jobOfferExpirationDatetimeUtc,
    this.jobOfferExpirationTimestamp,
    this.jobMinSalary,
    this.jobMaxSalary,
    this.jobSalaryCurrency,
    this.jobSalaryPeriod,
    this.jobPostingLanguage,
  });

  Job.fromJson(Map<String, dynamic> json) {
    employerName = json['employer_name'];
    employerLogo = json['employer_logo'];
    jobPublisher = json['job_publisher'];
    jobEmploymentType = json['job_employment_type'];
    jobTitle = json['job_title'];
    jobApplyLink = json['job_apply_link'];
    jobApplyIsDirect = json['job_apply_is_direct'];
    jobDescription = json['job_description'];
    jobIsRemote = json['job_is_remote'];
    jobPostedAtDatetimeUtc = json['job_posted_at_datetime_utc'];
    jobCity = json['job_city'];
    jobState = json['job_state'];
    jobCountry = json['job_country'];
    jobLatitude = json['job_latitude'];
    jobLongitude = json['job_longitude'];
    jobGoogleLink = json['job_google_link'];
    jobOfferExpirationDatetimeUtc = json['job_offer_expiration_datetime_utc'];
    jobOfferExpirationTimestamp = json['job_offer_expiration_timestamp'];
    jobMinSalary = json['job_min_salary'];
    jobMaxSalary = json['job_max_salary'];
    jobSalaryCurrency = json['job_salary_currency'];
    jobSalaryPeriod = json['job_salary_period'];
    jobPostingLanguage = json['job_posting_language'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['employer_name'] = employerName;
    _data['employer_logo'] = employerLogo;
    _data['job_publisher'] = jobPublisher;
    _data['job_employment_type'] = jobEmploymentType;
    _data['job_title'] = jobTitle;
    _data['job_apply_link'] = jobApplyLink;
    _data['job_apply_is_direct'] = jobApplyIsDirect;
    _data['job_description'] = jobDescription;
    _data['job_is_remote'] = jobIsRemote;
    _data['job_posted_at_datetime_utc'] = jobPostedAtDatetimeUtc;
    _data['job_city'] = jobCity;
    _data['job_state'] = jobState;
    _data['job_country'] = jobCountry;
    _data['job_latitude'] = jobLatitude;
    _data['job_longitude'] = jobLongitude;
    _data['job_google_link'] = jobGoogleLink;
    _data['job_offer_expiration_datetime_utc'] = jobOfferExpirationDatetimeUtc;
    _data['job_offer_expiration_timestamp'] = jobOfferExpirationTimestamp;
    _data['job_min_salary'] = jobMinSalary;
    _data['job_max_salary'] = jobMaxSalary;
    _data['job_salary_currency'] = jobSalaryCurrency;
    _data['job_salary_period'] = jobSalaryPeriod;
    _data['job_posting_language'] = jobPostingLanguage;
    return _data;
  }
}
