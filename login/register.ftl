<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('role',properties.kcFormGroupErrorClass!)}">
           
             
            <div class="${properties.kcInputWrapperClass!}">
                    <select       id="user.attributes.role"
                        class="${properties.kcInputClass!}"
                        name="user.attributes.role"

                        value="${(register.formData['user.attributes.role']!'')}">
                        <option value="" disabled selected>Select Your Account Type</option>
                        <option value="Client" title="Client">Business</option>
                        <option value="Agent" title="Agent">Agent</option>
                    </select>
            </div>
           </div>
            <div hidden class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('industry',properties.kcFormGroupErrorClass!)} businessOnly">
                <div  class="${properties.kcInputWrapperClass!}  ">
                    <select       id="user.attributes.industry"
                        class="${properties.kcInputClass!}"
                        name="user.attributes.industry"

                        value="${(register.formData['user.attributes.industry']!'')}">
                        <option value="" disabled selected>Select Your Industry Type</option>
                            <option value="Real Estate" title="Client">Real Estate</option>
                            <option value="Health" title="Health">Health</option>
                        <option value="Media" title="Media">Media</option>
                        <option value="Residential Services" title="Residential Services">Residential Services</option>
                        <option value="Other" title="Other">Other</option>
                    </select>
                
            </div>
            </div>  
            <div hidden class="${properties.kcFormGroupClass!}  ${messagesPerField.printIfExists('businessName',properties.kcFormGroupErrorClass!)} businessOnly">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="businessName" class="${properties.kcLabelClass!}">${msg("Business Name")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="businessName" class="${properties.kcInputClass!}" name="businessName"
                           value="${(register.formData.businessName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('businessName')>true</#if>"
                           placeholder="Business Name"
                    />

                    <#if messagesPerField.existsError('businessName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('businessName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>              
        <div hidden class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('agent_type',properties.kcFormGroupErrorClass!)} agentOnly" >  
            <div class="${properties.kcInputWrapperClass!} ">
                <select       id="user.attributes.agent_type"
                class="${properties.kcInputClass!}"
                name="user.attributes.agent_type"

                value="${(register.formData['user.attributes.agent_type']!'')}">
                <option value="" disabled selected>Select Your Agent Type</option>
                    <option value="receptionist" title="Receptionist">Receptionist</option>
                    <option value="sales" title="Sales">Sales</option>
                <option value="help_desk" title="Help Desk">Help Desk</option>
                <option value="call_logger" title="Call Logger">Call Logger</option>
                </select>
                </div>
        </div>
            <script>
                    document.addEventListener("DOMContentLoaded", function(event) { 
                    //do work
                    console.log("Javascript")
                    document.getElementById("user.attributes.role").addEventListener('change', (event) => {
                        if(event.target.selectedOptions[0].value==="Client"){
                        const collection = document.getElementsByClassName("businessOnly");
                        for (let i = 0; i < collection.length; i++) {
                            collection[i].hidden = false;
                            }
                        const collection2 = document.getElementsByClassName("agentOnly");
                            for (let i = 0; i < collection2.length; i++) {
                                    collection2[i].hidden = true;
                                    }

                        }else{
                                const collection = document.getElementsByClassName("businessOnly");
                            for (let i = 0; i < collection.length; i++) {
                                    collection[i].hidden = true;
                                    }

                    const collection2 = document.getElementsByClassName("agentOnly");
                            for (let i = 0; i < collection2.length; i++) {
                                    collection2[i].hidden = false;
                                    }
                        }
                    })
                    });
                    const element = document.getElementById("user.attributes.role");
                    element.addEventListener("click", function() {
                        console.log('DOUBLE')
                    
                    });
            </script>                    
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="text" id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password" class="${properties.kcInputClass!}" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm"
                               class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <input type="password" id="password-confirm" class="${properties.kcInputClass!}"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>