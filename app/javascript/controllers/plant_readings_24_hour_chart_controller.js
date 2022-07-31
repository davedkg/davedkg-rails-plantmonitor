import { Controller } from "stimulus"

 export default class extends Controller {

  // *** Getters

  get soilMoisture() {
    return JSON.parse(this.data.get("soil-moisture"))
  }

  get humidity() {
    return JSON.parse(this.data.get("humidity"))
  }

  get temperature() {
    return JSON.parse(this.data.get("temperature"))
  }

  get lightIntensity() {
    return JSON.parse(this.data.get("light-intensity"))
  }

  get rainMoisture() {
    return JSON.parse(this.data.get("rain-moisture"))
  }

  // *** Lifecycle

   connect() {
    console.log('rainMoisture', this.rainMoisture)
   }
 }