module.exports = debug:
  files: [
    {
      expand: true
      cwd: "app/js"
      src: ["*.js"]
      dest: "dist/js"
    },
    {
      expand: true
      cwd: "app/img"
      src: ["*"]
      dest: "dist/img"
    }
  ]