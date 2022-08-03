import { Controller } from "stimulus";

var Highcharts = require("highcharts");

export default class extends Controller {
  // *** Getters

  get soilMoisture() {
    return JSON.parse(this.data.get("soil-moisture"));
  }

  get humidity() {
    return JSON.parse(this.data.get("humidity"));
  }

  get temperature() {
    return JSON.parse(this.data.get("temperature"));
  }

  get lightIntensity() {
    return JSON.parse(this.data.get("light-intensity"));
  }

  get rainMoisture() {
    return JSON.parse(this.data.get("rain-moisture"));
  }

  // *** Lifecycle

  connect() {
    Highcharts.chart(this.element, {
      title: {
        text: null,
      },
      yAxis: {
        title: {
          text: null,
        },
      },
      series: [
        {
          name: "Soil Moisture",
          data: this.soilMoisture,
        },
        {
          name: "Humidity",
          data: this.humidity,
        },
        {
          name: "Temperature",
          data: this.temperature,
        },
        {
          name: "Light Intensity",
          data: this.lightIntensity,
        },
        {
          name: "Rain Moisture",
          data: this.rainMoisture,
        },
      ],
    });
  }
}
