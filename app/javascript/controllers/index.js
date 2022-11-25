// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LinePhotoController from "./line_photo_controller"
application.register("line-photo", LinePhotoController)

import NearAreasController from "./near_areas_controller"
application.register("near-areas", NearAreasController)
