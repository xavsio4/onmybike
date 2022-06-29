<template>
  <li :style="itemStyle" class="timeline-item">
    <div
      ref="others"
      :style="circleStyle"
      :class="slotClass"
      class="timeline-circle rounded-full flex items-center justify-center font-mono font-extrabold"
    >
      <span class="text-white"><slot name="others">1</slot></span>
    </div>

    <div class="font-semibold text-xl">
      <div class="flex gap-1">
        <span class="flex"> <slot name="title"></slot></span>
        <span class="flex"><slot name="distance">0</slot></span>
        <span class="flex"><slot name="metric">Km</slot></span>
      </div>

      <nigth-icon class="w-5" />
    </div>

    <div class="bg-gray-100 rounded-3xl p-6">
      <slot name="notes"></slot>
    </div>

    <slot />
  </li>
</template>

<script>
  import NigthIcon from "./icons/NightIcon.vue";
  export default {
    components: {
      NigthIcon,
    },
    name: "WebTimelineItem",
    props: {
      bgColor: {
        type: String,
        default: "",
      },
      lineColor: {
        type: String,
        default: "",
      },
      hollow: {
        type: Boolean,
        default: false,
      },
      iconSize: {
        type: String,
        default: "",
      },
      fontColor: {
        type: String,
        default: "#333",
      },
    },
    data() {
      return {
        slotOthers: false,
        iconSizeData: {
          small: {
            top: ".28em",
            left: "-34px",
            width: "10px",
            height: "10px",
          },
          medium: {
            top: "0em",
            left: "-39.5px",
            height: "20px",
            width: "20px",
          },
          large: {
            top: "-0.5em",
            left: "-44px",
            height: "30px",
            width: "30px",
          },
        },
      };
    },
    computed: {
      circleStyle() {
        if (!this.bgColor && !this.lineColor && !this.hollow && !this.iconSize)
          return;
        let style = {};
        if (this.bgColor) {
          style = {
            "border-color": this.bgColor,
            "background-color": this.bgColor,
          };
        }
        if (this.lineColor) {
          style = Object.assign({}, style, {
            "border-color": this.lineColor,
          });
        }
        if (this.fontColor) {
          style = Object.assign({}, style, {
            color: this.fontColor,
          });
        }
        if (this.iconSizeData[this.iconSize]) {
          style = Object.assign({}, style, this.iconSizeData[this.iconSize]);
        }
        return style;
      },
      itemStyle() {
        return {
          color: this.fontColor,
        };
      },
      slotClass() {
        let className = "";
        if (this.slotOthers) {
          className = "timeline-others";
        } else if (this.hollow) {
          className = "hollow";
        }
        return className;
      },
    },
    mounted() {
      this.slotOthers = !!this.$refs.others.innerHTML;
    },
  };
</script>
