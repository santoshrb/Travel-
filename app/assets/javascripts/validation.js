$(function(){

$.validator.addMethod("loginRegex", function (value, element) {
          return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.(com|net|org|info|com.au|in|co.in|))?$/.test(value);
}, "Email address must be in the format of name@domain.com");

$.validator.addMethod("lettersOnly", function (value, element) {
    return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
}, "Please enter letters only,no blank space allowed.");

$.validator.addMethod("numbersOnly", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Please enter numbers only.");

$.validator.addMethod("passportNo", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9-]+$/i.test(value);
}, "Please enter Valid Passport No.");

$.validator.addMethod("textOnly", function (value, element) {
    return !/[0-9]*/.test(value);
},"Alpha Characters Only.");

$.validator.addMethod("mobileNo", function (value, element) {
    return this.optional(element) || /^[0-9-]+$/.test(value);
},"Please Input Valid Contact No.");

$.validator.addMethod("bankName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("contactNo", function (value, element) {
    return this.optional(element) || /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/.test(value);
},"Please Input Valid Contact No.");

$.validator.addMethod("iifcCode", function (value, element) {
    return /^([A-Z]{4})(\d{7})$/.test(value);
},"Please Input Proper IIFC Code Format eg:ABHY1234567.");

$.validator.addMethod("branchCode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Branch Code must be in the format of eg:123456");

$.validator.addMethod("micrCode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "MICR Code must be in the format of eg:123456789");

$.validator.addMethod("cityName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_]+$/i.test(value);
},"Please Input Letters Only,no blank spaces allowed.");

$.validator.addMethod("stateName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("CertName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("AwardName", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("AwardFrom", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("ReffFrom", function (value, element) {
    return this.optional(element) || /^[a-zA-Z_ ]+$/i.test(value);
},"Please Input Letters Only.");

$.validator.addMethod("status", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  Correct Status.");

$.validator.addMethod("probPeriod", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  correct format eg:90 days.");

$.validator.addMethod("noticePeriod", function (value, element) {
    return this.optional(element) || /^[0-9a-zA-Z_ ]+$/i.test(value);
},"Please Input  correct format eg:90 days.");

$.validator.addMethod("pincode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
},"Please Input Digits Only Eg:400703.");

$.validator.addMethod("adharNO", function (value, element) {
    return this.optional(element) || /^[0-9]+$/i.test(value);
}, "Please enter valid Adhar No Format eg:123456789101.");

$.validator.addMethod("cus_url", function (value, element){
    return this.optional(element) || /^(www\.)?[a-zA-Z0-9\-]{3,}(\.(com|net|org|in|co.in))?$/.test(value);
}, "Invalid URL");

$.validator.addMethod("pan", function (value, element){
    return this.optional(element) || /^([A-Z]{5})(\d{4})([A-Z]{1})$/.test(value);
}, "Invalid Pan Number");

$.validator.addMethod("reg_no", function (value, element) {
    return /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9@.-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/.test(value);
},"Please Enter Valid Reg No.");

$.validator.addMethod("address", function (value, element) {
    return /^[a-zA-Z0-9-\/] ?([a-zA-Z0-9-\/]|[a-zA-Z0-9-\/] )*[a-zA-Z0-9-\/]$/.test(value);
},"Alpha Characters Only.");

 
  $("#company").validate({
    rules: {
      "company[name]":{
        required: true
      },
      "company[manual_company_code]":{
        required: true
      },
      "company[registration_no]":{
        maxlength: 30,
        required: true,
      },
       "company[address]":{
        required: true,
      },
      "company[contact_no]":{
        required: true,
          maxlength: 19
      },
      "company[starting_date]":{
          required: true
      },
      "company[email]":{
        loginRegex: true,
        required: true
      },
      "company[pan_card_no]":{
          maxlength: 10,
          required: true,
          pan:true
      },
      "company[city]":{
          required: true  
      },
      "company[district_id]":{
          required: true 
      },
      "company[pin_code]":{
          maxlength: 6,
          required: true,
          numbersOnly:true
      },
      "company[state_id]":{
          required: true 
      },
      "company[country_id]":{
          required: true 
      },
      "company[web_site]":{
          required: true,
          cus_url:true
      }

    },
    messages: {
      "company[name]":{
        required: "Please specify company",
      },
      "company[registration_no]":{
        required: "Please Specify Registration No",
      },
      "company[address]":{
        required: "Please Specify Address",
      },
     "company[contact_no]":{
      required: "Please Specify Contact No",
      maxlength: "Enter the Correct contact number"
      },
      "company[tax_no]":{
          maxlength: "Enter the Valid Tax number"
      },
      "company[pan_card_no]":{
        required: "Please Enter Valid Pancard Details",
        maxlength: "Enter the Pancard Details max 10 char"
      },
      "company[email]":{
       required: "Please Specify Email ID"
      },
      "company[starting_date]":{
        required: "Date can't be blank",
      },
      "company[city]":{
        required: "Please Enter City Details",
        maxlength: "City Details allows max 30 characters"
      },
      "company[district_id]":{
        required: "Please Enter District Details"
      },
      "company[pin_code]":{
        required: "Please Enter Pincode Details",
        maxlength: "Pincode Details allows max 9 digits"
      },
      "company[state_id]":{
        required: "Please Enter State Details"
      },
      "company[country_id]":{
        required: "Please Enter State Details"
      },
      "company[web_site]":{
        required: "Please Enter Website Name"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
  });

$("#company_location").validate({
    rules: {
      "company_location[name]":{
        required: true
      },
      "company_location[manual_company_location_code]":{
        required: true
      }, 
      "company_location[contact_no]":{
        maxlength: 16
      },
      "company_location[state_id]":{
        required: true
      },
      "company_location[country_id]":{
        required: true
      },
      "company_location[district_id]":{
        required: true
      },
      "company_location[city]":{
        required: true
      },
      "company_location[pin_code]":{
        maxlength: 6,
        required: true,
        numbersOnly: true
      },
    },
    messages: {
      "company_location[name]":{
        required: "Please specify company Name"
      },
      "company_location[manual_company_location_code]":{
        required: "Please specify company Location code"
      },
      "company_location[district_id]":{
        required: "Please Specify District"
      },
      "company_location[state_id]":{
        required: "Please Specify state"
      },
      "company_location[country_id]":{
        required: "Please Specify Country"
      },
      "company_location[contact_no]":{
        required: "Please Specify Contact No",
        maxlength: "Enter the Correct contact number"
      },
      "company_location[city]":{
        required: "Please Specify Your City"
      },
      "company_location[pin_code]":{
        maxlength: "Please Enter Valid Pincode Details upto 6 digit max"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }

   });

$("#company_type").validate({
    rules: {
      "company_type[name]":{
        required: true,
        maxlength: 30
      }
    },
    messages: {
      "company_type[name]":{
        required: "Please Specify Company Type",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });



$("#department_type").validate({
    rules: {
      "department_type[name]":{
        required: true
      }
    },
    messages: {
      "department_type[name]":{
        required: "Please specify Dept Type"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });



$("#employee_grade").validate({
    rules: {
      "employee_grade[name]":{
        required: true
      }
    },
    messages: {
      "employee_grade[name]":{
        required: "Please Specify Employee Grade"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#employee_physical").validate({
    rules: {
      "employee_physical[height]":{
        required: true,
        maxlength: 8,
      },
      "employee_physical[weight]":{
        required: true,
        maxlength: 6, 
      },
      "employee_physical[size]":{
        required: true,
        maxlength: 6, 
      }
    },
    messages: {
      "employee_physical[height]":{
        required: "Please specify Employee Height",
        maxlength: "Height allows upto 5 integers"
      },
      "employee_physical[weight]":{
        required: "Please specify Employee Weight",
        maxlength: "Employee Weight allows upto 6 integers"
      },
      "employee_physical[size]":{
        required: "Please specify Size",
        maxlength: "Employee T-Size allows upto 6 int"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });


$("#family").validate({
    rules: {
      "family[f_name]":{
        required: true,
        maxlength: 30
      },
      "family[m_name]":{
        maxlength: 30
      },
      "family[l_name]":{
        maxlength: 30
      },
      "family[age]":{
        maxlength: 3,
        numbersOnly: true
      },
      "family[contact_no]":{
        maxlength: 13,
        contactNo: true
      },
      "family[relation]":{
        required: true,
        maxlength: 30
      },
      "family[adhar_no]":{
        maxlength: 12,
        adharNO:true
      },
      "family[pan_no]":{
        maxlength: 10,
        pan:true
      },
      "family[passport_no]":{
        maxlength: 8,
        passportNo: true
      },
      "family[religion]":{
       maxlength: 30
      },
      "family[profession]":{
        maxlength: 30
      }
    },
    messages: {
      "family[f_name]":{
        required: "Please specify First Name",
        maxlength: "Name allows upto 30 characters"
      },
      "family[m_name]":{
        maxlength: "Name allows upto 30 characters"
      },
       "family[l_name]":{
        maxlength: "Name allows upto 30 characters"
      },
      "family[age]":{
        maxlength: "Please specify Correct Age"
      },
      "family[contact_no]":{
        maxlength: "Enter the Correct contact number"
      },
      "family[relation]":{
        required: "Please specify Relation Details",
        maxlength: "Relation allows upto 50 characters"
      },
      "family[adhar_no]":{
        maxlength: "Aadhaar No allows upto 12 digits"
      },
      "family[pan_no]":{ 
        maxlength: "Pan Card No allows upto 10 alphanumeric characters"
      },
      "family[passport_no]":{
        maxlength: "Passport No allows upto 8 characters"
      },
      "family[religion]":{
        maxlength: "Religion allows upto 30 characters"
      },
      "family[profession]":{
        maxlength: "Profession allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#leav_cate").validate({
    rules: {
      "leav_category[name]":{
        required: true,
        maxlength: 30
      }
    },
    messages: {
      "leav_category[name]":{
        required: "Please specify Employee Name",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#company_leav").validate({
    rules: {
      "company_leav[no_of_leave]":{
        required: true,
        maxlength: 20
      },
      "company_leav[expire_date]":{
        required: true
      }
    },
    messages: {
      "company_leav[no_of_leave]":{
        required: "Please specify No. Of leaves",
        maxlength: "No. Of leaves allows upto 20 characters"
      },
      "company_leav[expire_date]":{
        required: "Please specify Expiry Details for Leave"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#employee_leav_request").validate({
    rules: {
      "employee_leav_request[satrt_date]":{
        required: true
      },
      "employee_leav_request[end_date]":{
        required: true
      }
    },
    messages: {
      "employee_leav_request[satrt_date]":{
        required: "Please specify Start Date for Leave"
      },
      "employee_leav_request[end_date]":{
        required: "Please specify End Date for Leave"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });




$("#certification").validate({
    rules: {/*qualification_id*/
      "certification[qualification_id]":{
        maxlength: 30
      },
      "certification[name]":{
        maxlength: 30,
        CertName:true
      },
      "certification[year]":{
        maxlength: 4,
        numbersOnly:true
      },/*duration*/
      "certification[duration]":{
        maxlength: 30,
        numbersOnly:true
      },
      "certification[descripation]":{
        maxlength: 200
      }
    },
    messages: {
      "certification[qualification_id]":{  
        maxlength: "Qualification ID allows upto 30 characters"
      },
      "certification[name]":{ 
        maxlength: "Certification Name allows upto 30 characters"
      },
      "certification[year]":{ 
        maxlength: "Please Input Correct Year format"
      },
      "certification[duration]":{
        maxlength: "Please Input Correct Year format"
      },
      "certification[descripation]":{
        maxlength: "Certification Description allows upto 200 char max"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#employee_type").validate({
    rules: {
      "employee_type[name]":{
        required: true,
        maxlength: 30
      }
    },
    messages: {
      "employee_type[name]":{
        required: "Please Specify Employee Type",
        maxlength: "Name allows upto 30 alphabets"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#employee_bank_detail").validate({
    rules: {
      "employee_bank_detail[account_no]":{
        maxlength: 15,
        numbersOnly:true
      },
      "employee_bank_detail[bank_name]":{
        maxlength: 30,
        required:true,
        bankName:true
      },
      "employee_bank_detail[branch_name]":{
        maxlength: 30,
        required:true,
        bankName:true
      },
      "employee_bank_detail[contact_no]":{
        maxlength: 13,
        contactNo:true
      },
      "employee_bank_detail[micr_code]":{
        maxlength: 9,
        micrCode:true
      },
      "employee_bank_detail[branch_code]":{
        maxlength: 6,
        branchCode:true
      },
      "employee_bank_detail[ifsc_code]":{
        maxlength: 11,
        iifcCode:true
      }
    },
    messages: {
      "employee_bank_detail[account_no]":{
        maxlength: "Account No allows upto 15 Digits"
      },
      "employee_bank_detail[bank_name]":{
        required: "Please Specify Bank Name",
        maxlength: "Bank Name allows upto 30 Characters"
      },
      "employee_bank_detail[branch_name]":{
        required: "Please Specify Bank Name",
        maxlength: "Branch Name allows upto 30 Characters"
      },
      "employee_bank_detail[contact_no]":{
        maxlength: "Contact No allows upto 13 Digits"
      },
      "employee_bank_detail[micr_code]":{
        maxlength: "MICR Code allows upto 9 Digits"
      },
      "employee_bank_detail[branch_code]":{
        maxlength: "MICR Code allows upto 9 Digits"
      },
      "employee_bank_detail[ifsc_code]":{
        maxlength: "IFSC Code allows upto 11 Digits"
      }
    },
    errorPlacement: function(error, element) {
     error.css({"color": "red", "font-size": "12px","font-weight" : "normal"})
     error.insertAfter(element.parent(element));
    }
   });

$("#employee_shift").validate({
    rules: {
      "employee_shift[company_shift_id]":{
        required: true
       }
    },
    messages: {
      "employee_shift[company_shift_id]":{
        required: "Please specify Company Shift Id"
      }
    },
    errorPlacement: function(error, element) {
     error.css('color','red')
     error.insertAfter(element.parent(element));
    }
   });
});