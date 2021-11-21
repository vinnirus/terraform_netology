### devops-10 student

### HW-7.6.Написание собственных провайдеров для Terraform.

---

1.</br>

---
Все доступные *resource* и *data_source* перечислены в файле [provider.go](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go)
в структурах *DataSourcesMap* 
и *ResourcesMap*. Ниже приведены несколько строк этих структур:

```
		DataSourcesMap: map[string]*schema.Resource{
			"aws_acm_certificate": acm.DataSourceCertificate(),

			"aws_acmpca_certificate_authority": acmpca.DataSourceCertificateAuthority(),
			"aws_acmpca_certificate":           acmpca.DataSourceCertificate(),

			"aws_api_gateway_api_key":     apigateway.DataSourceAPIKey(),
			"aws_api_gateway_domain_name": apigateway.DataSourceDomainName(),
			"aws_api_gateway_resource":    apigateway.DataSourceResource(),
			"aws_api_gateway_rest_api":    apigateway.DataSourceRestAPI(),
			"aws_api_gateway_vpc_link":    apigateway.DataSourceVPCLink(),

			"aws_apigatewayv2_api":  apigatewayv2.DataSourceAPI(),
			"aws_apigatewayv2_apis": apigatewayv2.DataSourceAPIs(),

			"aws_appmesh_mesh":            appmesh.DataSourceMesh(),
			"aws_appmesh_virtual_service": appmesh.DataSourceVirtualService(),

			"aws_autoscaling_group":    autoscaling.DataSourceGroup(),
			"aws_autoscaling_groups":   autoscaling.DataSourceGroups(),
			"aws_launch_configuration": autoscaling.DataSourceLaunchConfiguration(),

```
и

```
	ResourcesMap: map[string]*schema.Resource{
			"aws_accessanalyzer_analyzer": accessanalyzer.ResourceAnalyzer(),

			"aws_account_alternate_contact": account.ResourceAlternateContact(),

			"aws_acm_certificate":            acm.ResourceCertificate(),
			"aws_acm_certificate_validation": acm.ResourceCertificateValidation(),

			"aws_acmpca_certificate":                       acmpca.ResourceCertificate(),
			"aws_acmpca_certificate_authority":             acmpca.ResourceCertificateAuthority(),
			"aws_acmpca_certificate_authority_certificate": acmpca.ResourceCertificateAuthorityCertificate(),

			"aws_prometheus_workspace":                amp.ResourceWorkspace(),
			"aws_prometheus_alert_manager_definition": amp.ResourceAlertManagerDefinition(),
			"aws_prometheus_rule_group_namespace":     amp.ResourceRuleGroupNamespace(),

			"aws_amplify_app":                 amplify.ResourceApp(),
			"aws_amplify_backend_environment": amplify.ResourceBackendEnvironment(),
			"aws_amplify_branch":              amplify.ResourceBranch(),
			"aws_amplify_domain_association":  amplify.ResourceDomainAssociation(),
			"aws_amplify_webhook":             amplify.ResourceWebhook(),
```

---
В пакете *sqs* находится файл *queue.go*, в котором описаны все доступные параметры очередии,
в том числе и параметр *name*:

```
		"name": {
			Type:          schema.TypeString,
			Optional:      true,
			Computed:      true,
			ForceNew:      true,
			ConflictsWith: []string{"name_prefix"},
		},
```
Из описания видно, что этот параметр конфиликтует с параметром *name_prefix*.</br>
Максимальная длина имени составляет **26** символов.</br>
Имя должно подчиняться следующему регулярнму выражению:</br>
```
// Regexp pattern for "<start-of-string><prefix><26 lowercase hex digits><additional suffix><end-of-string>".
```

