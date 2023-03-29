package alerts

#alertLabels: {
    [string]: string
}

#alertAnnotations: {
    [string]: string
}

#prometheusRules: {
    apiVersion: "deckhouse.io/v1alpha1"
    kind: "CustomPrometheusRules"
    metadata: {
        annotations: gitrepo: "TODO"
        labels: {
            app: "prometheus"
            component: "rules"
            module: "prometheus"
            prometheus: "main"
        }
        name: string
    }
    spec:
        groups: [...{
            name: string
            rules: [...(#IstioHigh5xxErrorRate | #IstioHigh4xxErrorRate)]
        }]
}

#alert: {
    alert: string
    expr: string
    "for": string
    labels: #alertLabels
    annotations: #alertAnnotations
}
