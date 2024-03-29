import { Application } from "@hotwired/stimulus";
import RailsNestedForm from "@stimulus-components/rails-nested-form";
import Sortable from "@stimulus-components/sortable";

const application = Application.start();
application.register("nested-form", RailsNestedForm);
application.register("sortable", Sortable);

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
