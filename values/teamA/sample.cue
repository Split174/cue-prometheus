package teamAalerts

import (
    "github.com/Split174/cue-prometheus/alerts"
)

services: ["worker1", "worker2"]

_labels: {
    namespace: "teama-prod"
}

promRule: alerts.#prometheusRules & {
    metadata: name: "teama-rule"
    spec:
        groups: [{
            name: "slo-teama"
            rules: [
                for s in services {
                    alerts.#IstioHigh5xxErrorRate & {
                        #destination: s
                        #percentage:  1
                        labels: _labels & {
                            app: s
                            severity_level: "1"
                        }
                    }
                },
                for s in services {
                    alerts.#IstioHigh4xxErrorRate & {
                        #destination: s
                        #percentage:  1
                        labels: _labels & {
                            app: s
                            severity_level: "2"
                        }
                    }
                }   
            ]
        }]
}