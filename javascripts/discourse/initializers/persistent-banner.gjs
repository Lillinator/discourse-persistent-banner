import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";
import { inject as service } from "@ember/service";
import { htmlSafe } from "@ember/template";
import $ from "jquery";
import CookText from "discourse/components/cook-text";
import DButton from "discourse/components/d-button";
import { apiInitializer } from "discourse/lib/api";
import loadScript from "discourse/lib/load-script";

export default apiInitializer("1.14.0", (api) => {
  try {
    console.log(api.getCurrentUser());
    api.renderInOutlet(
      settings.banner_position,
      class persistentbanner extends Component {
        get bannerIsFilled() {
          if (settings.banner_text_content == "") {
            return false;
          } else if (settings.banner_visible == "hide") {
            return false;
          } else {
            return true;
          }
        }
        <template>
          {{#if bannerIsFilled}}
            <div class='persistent-banner'>
              <p>
                {{html_safe (theme-setting 'banner_text_content')}}
              </p>
            </div>
          {{/if}}
        </template>
      } 
    );
  } catch (e) {
    console.log(e);
  }
}
