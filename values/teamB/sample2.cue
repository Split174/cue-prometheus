package teamBalerts

import (
    "github.com/Split174/cue-prometheus/alerts"
)

promRule: [
    alerts.#IstioHigh5xxErrorRate & {
        #destination: "test"
        #percentage:  1
    },

    alerts.#IstioHigh4xxErrorRate & {
        #destination: "test"
        #percentage: 2
    }
]