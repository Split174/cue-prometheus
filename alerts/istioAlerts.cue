package alerts


#IstioHigh5xxErrorRate: #alert & {
    alert: "IstioHigh5xxErrorRate"
    expr: """
        sum(rate(istio_requests_total{reporter="\( #destination )", response_code=~"5.."}[5m])) / 
        sum(rate(istio_requests_total{reporter="\( #destination )"}[5m])) * 100 > \( #percentage )"""
    "for": "1m"
    #destination: string
    #percentage: *5 | number&>0
}

#IstioHigh4xxErrorRate: #alert & {
    alert: "IstioHigh5xxErrorRate"
    expr: """
        sum(rate(istio_requests_total{reporter="\( #destination )", response_code=~"4.."}[5m])) / 
        sum(rate(istio_requests_total{reporter="\( #destination )"}[5m])) * 100 > \( #percentage )"""
    "for": "1m"
    #destination: string
    #percentage: *5 | number&>0
}