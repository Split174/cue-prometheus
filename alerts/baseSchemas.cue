package alerts

#alertLabels: {
    [string]: string
}

#alertAnnotations: {
    [string]: string
}

#prometheusRules: {
    #alert
}

#alert: {
    alert: string
    expr: string
    "for": string
    labels: #alertLabels
    annotations: #alertAnnotations
}
